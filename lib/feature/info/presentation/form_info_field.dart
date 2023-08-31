import 'package:flutter/material.dart';

class FormInfoField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final String? errorMessage;

  const FormInfoField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    required this.errorMessage,
  }) : super(key: key);

  @override
  State<FormInfoField> createState() => _FormInfoFieldState();
}

class _FormInfoFieldState extends State<FormInfoField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
        errorText: widget.errorMessage,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
