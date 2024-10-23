import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key, required this.value});

  final bool value;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: CircleBorder(),
        value: widget.value,
        onChanged: (bool? value) {
          setState(() {
            value = !widget.value;
          });
        });
  }
}
