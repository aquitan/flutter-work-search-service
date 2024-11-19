import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/bloc/cubit/theme_cubit.dart';

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
    final brightness = context.read<ThemeCubit>().state.isDark;
    return Container(
      alignment: alignment,
      child: !brightness
          ? SvgPicture.asset('assets/logo/Logo-light.svg',
              width: width, height: height)
          : SvgPicture.asset('assets/logo/logo-dark.svg',
          width: width, height: height),
    );
  }
}
