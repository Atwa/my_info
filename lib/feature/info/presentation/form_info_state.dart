part of 'form_info_cubit.dart';

abstract class FormInfoState extends Equatable {
  const FormInfoState();

  @override
  List<Object?> get props => [];
}

class FormInfoInitial extends FormInfoValidation {
  FormInfoInitial() : super.failure(null, null);
}

class Loading extends FormInfoState {}

class FormInfoSuccessSubmission extends FormInfoState {}

class FormInfoValidation extends FormInfoState {
  late final bool isValidForm;
  late final String? errorMessage;
  late final FormFieldType? invalidFormField;

  FormInfoValidation.failure(this.errorMessage, this.invalidFormField) {
    isValidForm = false;
  }

  FormInfoValidation.success() {
    isValidForm = true;
    errorMessage = null;
    invalidFormField = null;
  }

  @override
  List<Object?> get props => [errorMessage];
}
