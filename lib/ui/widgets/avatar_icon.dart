import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class AvatarIcon extends StatelessWidget {
  const AvatarIcon({super.key, required this.iconAsset});

  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: theme.colorScheme.tertiary),
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(56.0),
      ),
      child: CustomSvgImage(assetName: iconAsset),
    );
  }
}
