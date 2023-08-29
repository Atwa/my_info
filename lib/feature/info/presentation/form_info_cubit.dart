import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../domain/validate_info_use_case.dart';

part 'form_info_state.dart';

class FormInfoCubit extends Cubit<FormInfoState> {
  final ValidateInfoUseCase validateInfoUseCase;

  FormInfoCubit({required this.validateInfoUseCase}) : super(InfoFormInitial());

  String _title = "";
  String _description = "";
  String _birthDate = "";
  String _phoneNumber = "";
  String _countryCode = "";

  void validateForm(){
    emit(Loading());
    validateInfoUseCase(_title, _description, _birthDate, _phoneNumber, _countryCode)
        .fold((left) => emit(ValidationError(left)),
            (right) => emit(ValidationSuccess()));
  }

  void setTitle(String title) => _title = title;
  void setDescription(String description) => _description = description;
  void setBirthDate(String birthDate) => _birthDate = birthDate;
  void setPhoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  void setCountryCode(String countryCode) => _countryCode = countryCode;

}
