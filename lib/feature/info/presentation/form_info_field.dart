import 'package:flutter/material.dart';

Widget formInfoField(
    TextEditingController controller, String hint, String? errorMessage) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      errorText: errorMessage,
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
