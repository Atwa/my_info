import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_info/feature/info/presentation/form_info_cubit.dart';

class FormInfoScreen extends StatefulWidget {
  const FormInfoScreen({super.key});

  @override
  State<FormInfoScreen> createState() => _FormInfoScreenState();
}

class _FormInfoScreenState extends State<FormInfoScreen> {
  late TextEditingController? _titleController,
      _descriptionController,
      _birthdateController,
      _phoneNumberController,
      _countryCodeController;

  @override
  void initState() {
    super.initState();

    FormInfoCubit cubit = BlocProvider.of<FormInfoCubit>(context);

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _birthdateController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _countryCodeController = TextEditingController();

    _titleController?.addListener(() {
      cubit.setTitle(_titleController?.text ?? '');
    });
    _descriptionController?.addListener(() {
      cubit.setDescription(_descriptionController?.text ?? '');
    });
    _birthdateController?.addListener(() {
      cubit.setBirthdate(_birthdateController?.text ?? '');
    });
    _phoneNumberController?.addListener(() {
      cubit.setPhoneNumber(_phoneNumberController?.text ?? '');
    });
    _countryCodeController?.addListener(() {
      cubit.setCountryCode(_countryCodeController?.text ?? '');
    });
  }

  @override
  void dispose() {
    _titleController?.dispose();
    _descriptionController?.dispose();
    _birthdateController?.dispose();
    _phoneNumberController?.dispose();
    _countryCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Title'),
        ),
        body: const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text(
                'Hello World',
              ),
            ])));
  }
}
