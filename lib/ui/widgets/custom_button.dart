import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.radius,
      required this.height,
      this.disabled,
      this.color = primaryColor,
      this.width = double.infinity,
      this.icon,
      this.textColor = Colors.white,
      this.textStyle});

  final Function() onTap;
  final String text;
  final double radius;
  final double height;
  final bool? disabled;
  final Color? color;
  final double? width;
  final Widget? icon;
  final Color? textColor;
  final String? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    TextStyle? defineTextStyle() {
      switch (textStyle) {
        case 'small':
          return theme.textTheme.bodySmall!.copyWith(color: textColor);
        case 'medium':
          return theme.textTheme.bodyMedium!.copyWith(color: textColor);
        case 'large':
          return theme.textTheme.bodyLarge!.copyWith(color: textColor);
        default:
          return theme.textTheme.bodyMedium!.copyWith(color: textColor);
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: EdgeInsets.all(10),
          width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
            color: disabled != null && disabled!
                ? theme.colorScheme.secondary
                : color,
        ),
        child: Row(
            spacing: 8.0,
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              if (icon != null) icon!,
              Text(
                text,
                style: defineTextStyle(),
              ),
          ],
        )
      ),
    );
  }
}
