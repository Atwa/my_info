import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/validate_info_use_case.dart';

part 'info_form_state.dart';

class InfoFormCubit extends Cubit<InfoFormState> {
  final ValidateInfoUseCase validateInfoUseCase;

  InfoFormCubit({required this.validateInfoUseCase}) : super(InfoFormInitial());

  String title = "";
  String description = "";
  String birthDate = "";
  String phoneNumber = "";
  String flagCode = "";

  void validateForm(){
      emit(Loading());
      validateInfoUseCase(title,description,birthDate,phoneNumber,flagCode);

  }





}
