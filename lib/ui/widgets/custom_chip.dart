import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomChip extends StatefulWidget {
  const CustomChip(
      {super.key, required this.text, this.icon, this.bgColor, this.avatar});

  final String text;
  final SvgPicture? icon;
  final Color? bgColor;
  final Widget? avatar;

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
            TextStyle(fontSize: 16.0, color: Color.fromRGBO(234, 100, 43, 1)),
      ),
    );
  }
}
