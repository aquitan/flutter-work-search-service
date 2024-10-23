import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthTypes extends StatefulWidget {
  final SvgPicture? icon;
  final Color? color;

  const AuthTypes({super.key, this.icon, this.color});

  @override
  State<AuthTypes> createState() => _AuthTypesState();
}

class _AuthTypesState extends State<AuthTypes> {
  SvgPicture? icon;
  Color? color;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: widget.icon,
    );
  }
}
