import 'package:flutter/material.dart';

class BlockWrapper extends StatelessWidget {
  const BlockWrapper(
      {super.key,
      required this.child,
      this.borderRadius,
      this.padding,
      this.shadow,
      this.offset});

  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Offset? offset;
  final BoxShadow? shadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: padding ?? EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: borderRadius ??
            BorderRadius.vertical(bottom: Radius.circular(24.0)),
      ),
      child: child,
    );
  }
}
