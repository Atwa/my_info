part of 'info_form_cubit.dart';

abstract class InfoFormState extends Equatable {

  const InfoFormState();

  @override
  List<Object> get props => [];
}

class InfoFormInitial extends InfoFormState {}

class ValidationSuccess extends InfoFormState {}

class Loading extends InfoFormState {}

class ValidationError extends InfoFormState {
  final String message;

  const ValidationError(this.message);

  @override
  List<Object> get props => [message];
}