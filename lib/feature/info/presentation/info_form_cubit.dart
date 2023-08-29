import 'package:bloc/bloc.dart';
part 'info_form_state.dart';


class InfoFormCubit extends Cubit<InfoFormState>{
  InfoFormCubit({
  }) : super(LoginInitial());
}