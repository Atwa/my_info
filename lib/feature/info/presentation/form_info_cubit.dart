import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:my_info/feature/info/domain/form_field.dart';

import '../domain/validate_info_use_case.dart';

part 'form_info_state.dart';

class FormInfoCubit extends Cubit<FormInfoState> {
  final ValidateInfoUseCase validateInfoUseCase;

  FormInfoCubit({required this.validateInfoUseCase})
      : super(FormInfoState.initial());

  String _title = "";
  String _description = "";
  String _birthdate = "";
  String _phoneNumber = "";
  String _countryCode = "";

  void validateForm() {
    emit(FormInfoState.loading());
    validateInfoUseCase(
            _title, _description, _birthdate, _phoneNumber, _countryCode)
        .fold((left) => emit(FormInfoState.error(left.message, left.field)),
            (right) => emit(FormInfoState.success()));
  }

  void setTitle(String title) => _title = title;

  void setDescription(String description) => _description = description;

  void setBirthdate(String birthdate) => _birthdate = birthdate;

  void setPhoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;

  void setCountryCode(String countryCode) => _countryCode = countryCode;
}
