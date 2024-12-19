import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgImage extends StatelessWidget {
  const CustomSvgImage(
      {super.key,
      required this.assetName,
      this.color,
      this.width,
      this.height});

  final String assetName;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SvgPicture.asset(assetName,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
            color != null ? color! : theme.iconTheme.color!, BlendMode.srcIn));
  }
}
