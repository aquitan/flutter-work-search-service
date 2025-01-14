import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialConnectBloc extends StatelessWidget {
  const SocialConnectBloc({super.key, required this.icon, required this.name});

  final String icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 165.0,
      height: 172.0,
      padding:
          EdgeInsets.only(top: 16.0, left: 12.0, bottom: 12.0, right: 12.0),
      decoration: BoxDecoration(
          color: theme.colorScheme.tertiaryFixedDim,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(width: 1, color: theme.colorScheme.tertiary)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8.0,
        children: [
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: SvgPicture.asset(
            icon,
            height: 30.0,
            width: 30.0,
          ),
          ),
          // CustomSvgImage(
          //   assetName: icon,
          //   width: 30.0,
          //   height: 30.0,
          // ),
          Text(
            name,
            style: theme.textTheme.titleSmall,
          ),
          OutlinedButton(
              onPressed: () {},
              child: Text(
                'Привязать',
                style: theme.textTheme.bodyMedium,
              ))
        ],
      ),
    );
  }
}
