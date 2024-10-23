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
    return Container(
      alignment: alignment,
      child: SvgPicture.asset('assets/logo/logo.svg',
          width: width, height: height),
    );
  }
}
