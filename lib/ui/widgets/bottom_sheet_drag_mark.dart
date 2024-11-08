import 'package:flutter/material.dart';

class BottomSheetDragMark extends StatelessWidget {
  const BottomSheetDragMark({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 4.0,
      width: 32.0,
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
