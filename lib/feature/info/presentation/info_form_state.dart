part of 'info_form_cubit.dart';

abstract class InfoFormState extends Equatable {
  const InfoFormState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends InfoFormState {}

class LoginSuccess extends InfoFormState {}

class LogoutSuccess extends InfoFormState {}

class LoginError extends InfoFormState {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}