import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      this.obscure = false,
      required this.label,
      this.hint,
      this.controller,
      this.isPassword = false,
      required this.validation,
      this.enabledBorder});

  final bool obscure;
  final String label;
  final String? hint;
  final bool? isPassword;
  final TextEditingController? controller;
  final InputBorder? enabledBorder;
  final FormFieldValidator<String> validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation(value),
      obscureText: obscure,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: enabledBorder,
        labelText: label,
        suffixIcon: isPassword!
            ? obscure
                ? Icon(Icons.visibility_off)
                : Icon(Icons.visibility)
            : null,
      ),
    );
  }
}
