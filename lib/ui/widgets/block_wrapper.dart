import 'package:flutter/material.dart';

class BlockWrapper extends StatelessWidget {
  const BlockWrapper(
      {super.key, required this.child, this.borderRadius, this.padding});

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding ?? EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: borderRadius ??
              BorderRadius.vertical(bottom: Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: child,
    );
  }
}
