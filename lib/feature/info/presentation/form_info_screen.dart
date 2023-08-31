import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_info/feature/info/domain/form_field_type.dart';
import 'package:my_info/feature/info/presentation/form_info_cubit.dart';
import 'package:my_info/feature/info/presentation/form_info_field.dart';
import 'package:my_info/feature/info/presentation/submit_button.dart';

class FormInfoScreen extends StatefulWidget {
  const FormInfoScreen({super.key});

  @override
  State<FormInfoScreen> createState() => _FormInfoScreenState();
}

class _FormInfoScreenState extends State<FormInfoScreen> {
  final TextEditingController _titleController = TextEditingController(),
      _descriptionController = TextEditingController(),
      _birthdateController = TextEditingController(),
      _phoneNumberController = TextEditingController(),
      _countryCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    FormInfoCubit cubit = BlocProvider.of<FormInfoCubit>(context);

    _titleController.addListener(() {
      cubit.setTitle(_titleController.text);
    });
    _descriptionController.addListener(() {
      cubit.setDescription(_descriptionController.text);
    });
    _birthdateController.addListener(() {
      cubit.setBirthdate(_birthdateController.text);
    });
    _phoneNumberController.addListener(() {
      cubit.setPhoneNumber(_phoneNumberController.text);
    });
    _countryCodeController.addListener(() {
      cubit.setCountryCode(_countryCodeController.text);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _birthdateController.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Info form'),
        ),
        body: BlocBuilder<FormInfoCubit, FormInfoState>(
            builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is FormInfoSuccessSubmission) {
            return Container();
          } else if (state is FormInfoValidation) {
            return Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                child: formInfoField(
                    _titleController,
                    'Title',
                    (state.invalidFormField == FormFieldType.description)
                        ? state.errorMessage
                        : null),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: formInfoField(
                  _descriptionController,
                  'Description',
                  (state.invalidFormField == FormFieldType.description)
                      ? state.errorMessage
                      : null,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: formInfoField(
                    _birthdateController,
                    'Birth Date',
                    (state.invalidFormField == FormFieldType.birthdate)
                        ? state.errorMessage
                        : null),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: formInfoField(
                    _phoneNumberController,
                    'Phone Number',
                    (state.invalidFormField == FormFieldType.phoneNumber)
                        ? state.errorMessage
                        : null),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: formInfoField(
                  _countryCodeController,
                  'Country Code',
                  (state.invalidFormField == FormFieldType.countryCode)
                      ? state.errorMessage
                      : null,
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Button(
                          isEnabled: state.isValidForm,
                          onPressed: () =>
                              BlocProvider.of<FormInfoCubit>(context)
                                  .submit())))
            ]);
          } else {
            return Container();
          }
        }));
  }
}
