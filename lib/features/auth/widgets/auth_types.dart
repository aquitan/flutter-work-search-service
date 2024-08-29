import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthTypes extends StatefulWidget {
  final SvgPicture? icon;
  final Color? color;

  const AuthTypes({Key? key, this.icon, this.color}) : super(key: key);

  @override
  _AuthTypesState createState() => _AuthTypesState(icon: this.icon, color: this.color);
}

class _AuthTypesState extends State<AuthTypes> {
  SvgPicture? icon;
  Color? color;

  _AuthTypesState({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: GestureDetector(
        onTap: () {},
        child: icon,
      ),
    );
  }
}
