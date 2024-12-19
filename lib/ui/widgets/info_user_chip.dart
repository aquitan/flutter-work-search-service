import 'package:flutter/material.dart';

class InfoUserChip extends StatelessWidget {
  const InfoUserChip({super.key, required this.child, required this.title});

  final String child;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.colorScheme.tertiary),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: theme.colorScheme.secondary)),
          Text(child),
        ],
      ),
    );
  }
}
