import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onTap, required this.text, required this.radius});

  final Function() onTap;
  final String text;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: theme.colorScheme.primary
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
          ],
        )
      ),
    );
  }
}
