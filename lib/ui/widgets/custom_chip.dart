import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  const CustomChip(
      {
    super.key,
    required this.text,
    this.bgColor,
    this.avatar,
    this.textColor,
    this.fontSize,
    this.shape,
    this.borderWidth,
    this.borderColor,
    this.padding = 8,
  });

  final String text;
  final Color? bgColor;
  final Widget? avatar;
  final Color? textColor;
  final double? fontSize;
  final OutlinedBorder? shape;
  final double? borderWidth;
  final Color? borderColor;
  final double? padding;

  @override
  State<CustomChip> createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.all(widget.padding!),
      avatar: widget.avatar,
      backgroundColor: widget.bgColor,
      shape: widget.shape,
      side: BorderSide(
        width: widget.borderWidth ?? 0,
        color: widget.borderColor ?? Colors.transparent,
      ),
      label: Text(
        widget.text,
        style:
            TextStyle(fontSize: widget.fontSize, color: widget.textColor),
      ),
    );
  }
}
