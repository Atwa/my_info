import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_info/feature/info/domain/form_field_type.dart';
import 'package:my_info/feature/info/presentation/form_info_cubit.dart';
import 'package:my_info/feature/info/presentation/form_info_field.dart';
import 'package:my_info/feature/info/presentation/submit_button.dart';

import '../../../router/route_constants.dart';

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

  late FormInfoCubit _cubit;

  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<FormInfoCubit>(context);

    _titleController.addListener(() {
      _cubit.setTitle(_titleController.text);
    });
    _descriptionController.addListener(() {
      _cubit.setDescription(_descriptionController.text);
    });
    _birthdateController.addListener(() {
      _cubit.setBirthdate(_birthdateController.text);
    });
    _phoneNumberController.addListener(() {
      _cubit.setPhoneNumber(_phoneNumberController.text);
    });
    _countryCodeController.addListener(() {
      _cubit.setCountryCode(_countryCodeController.text);
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
        body: BlocConsumer<FormInfoCubit, FormInfoState>(
          buildWhen: (previous, current) =>
              current is FormInfoValidation || current is Loading,
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FormInfoValidation) {
              return Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 70, 20, 0),
                  child: FormInfoField(
                      controller: _titleController,
                      hint: 'Title',
                      keyboardType: TextInputType.name,
                      errorMessage:
                          (state.invalidFormField == FormFieldType.title)
                              ? state.errorMessage
                              : null),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: FormInfoField(
                    controller: _descriptionController,
                    hint: 'Description',
                    keyboardType: TextInputType.text,
                    errorMessage:
                        (state.invalidFormField == FormFieldType.description)
                            ? state.errorMessage
                            : null,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: FormInfoField(
                      controller: _birthdateController,
                      hint: 'Birth Date',
                      keyboardType: TextInputType.datetime,
                      errorMessage:
                          (state.invalidFormField == FormFieldType.birthdate)
                              ? state.errorMessage
                              : null),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: FormInfoField(
                      controller: _phoneNumberController,
                      hint: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      errorMessage:
                          (state.invalidFormField == FormFieldType.phoneNumber)
                              ? state.errorMessage
                              : null),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: FormInfoField(
                    controller: _countryCodeController,
                    hint: 'Country Code',
                    keyboardType: TextInputType.phone,
                    errorMessage:
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
                            onPressed: () => _cubit.submit())))
              ]);
            } else {
              return const SizedBox.shrink();
            }
          },
          listenWhen: (previous, current) =>
              current is FormInfoSuccessSubmission,
          listener: (context, state) {
            Navigator.of(context).pushNamed(RouteList.media);
          },
        ));
  }
}
