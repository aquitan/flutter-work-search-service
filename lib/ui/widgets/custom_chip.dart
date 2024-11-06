import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  const CustomChip(
      {super.key,
      required this.text,
      this.bgColor,
      this.avatar,
      this.textColor,
      this.fontSize});

  final String text;
  final Color? bgColor;
  final Widget? avatar;
  final Color? textColor;
  final double? fontSize;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: widget.avatar,
      backgroundColor: widget.bgColor,
      side: BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
      label: Text(
        widget.text,
        style:
            TextStyle(fontSize: widget.fontSize, color: widget.textColor),
      ),
    );
  }
}
