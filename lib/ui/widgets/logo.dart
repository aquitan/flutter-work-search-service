import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {
  const Logo(
      {super.key,
      this.width = 180,
      this.height = 62,
      this.alignment = Alignment.center});

  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      alignment: alignment,
      child: isDarkMode
          ? SvgPicture.asset('assets/logo/logo-dark.svg',
              width: width, height: height)
          : SvgPicture.asset('assets/logo/Logo-light.svg',
              width: width, height: height),
    );
  }
}
