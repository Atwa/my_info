part of 'form_info_cubit.dart';

abstract class FormInfoState extends Equatable {

  const FormInfoState();

  @override
  List<Object> get props => [];
}

class InfoFormInitial extends FormInfoState {}

class ValidationSuccess extends FormInfoState {}

class Loading extends FormInfoState {}

class ValidationError extends FormInfoState {
  final String message;

  const ValidationError(this.message);

  @override
  List<Object> get props => [message];
}