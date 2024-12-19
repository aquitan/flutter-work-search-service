import 'package:flutter/material.dart';

class CustomTextfieldBordered extends StatelessWidget {
  const CustomTextfieldBordered(
      {super.key,
      required this.label,
      required this.controller,
      this.filled,
      this.prefixIcon,
      this.suffixIcon,
      this.readOnly,
      this.hint,
      this.maxLength});

  final String label;
  final bool? filled;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? readOnly;
  final String? hint;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
        readOnly: readOnly != null ? true : false,
        controller: controller,
        maxLength: maxLength,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: filled,
          fillColor: theme.cardTheme.color,
          isDense: true,
          hintText: hint,
          label: Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(width: 1.0, color: theme.colorScheme.tertiary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(width: 1.0, color: theme.colorScheme.tertiary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(width: 1.0, color: theme.colorScheme.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(width: 1.0, color: theme.colorScheme.error)),
          errorStyle: theme.textTheme.bodySmall!
              .copyWith(color: theme.colorScheme.error),
        ));
  }
}
