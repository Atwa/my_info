import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:my_info/feature/info/domain/form_field_type.dart';

import '../domain/validate_info_use_case.dart';

part 'form_info_state.dart';

class FormInfoCubit extends Cubit<FormInfoState> {
  final ValidateInfoUseCase validateInfoUseCase;

  FormInfoCubit(this.validateInfoUseCase) : super(FormInfoInitial());

  String _title = "";
  String _description = "";
  String _birthdate = "";
  String _phoneNumber = "";
  String _countryCode = "";

  void validateForm() {
    validateInfoUseCase(
            _title, _description, _birthdate, _phoneNumber, _countryCode)
        .fold((left) => emit(FormInfoValidation.failure(left.message, left.field)),
            (right) => emit(FormInfoValidation.success()));
  }

  void setTitle(String title) {
    _title = title;
    validateForm();
  }

  void setDescription(String description) {
    _description = description;
    validateForm();
  }

  void setBirthdate(String birthdate) {
    _birthdate = birthdate;
    validateForm();
  }

  void setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    validateForm();
  }

  void setCountryCode(String countryCode) {
    _countryCode = countryCode;
    validateForm();
  }

  Future<void> submit() async {
    emit(Loading());
    Future.delayed(const Duration(seconds: 2));
    emit(FormInfoSuccessSubmission());
  }

}
