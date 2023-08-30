part of 'form_info_cubit.dart';

class FormInfoState extends Equatable {
  bool loading = false;
  bool validForm = false;
  String? errorMessage;
  FormField? formField;

  FormInfoState.initial();

  FormInfoState.loading() {
    loading = true;
  }

  FormInfoState.success() {
    validForm = true;
  }

  FormInfoState.error(
    this.errorMessage,
    this.formField,
  );

  @override
  List<Object?> get props => [loading, validForm, errorMessage, formField];
}