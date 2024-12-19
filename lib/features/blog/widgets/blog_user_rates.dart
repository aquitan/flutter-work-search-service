import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BlogUserRates extends StatelessWidget {
  const BlogUserRates({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 12.0,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: List.generate(
                5,
                (index) {
                  for (int i = 0; i < rating; i++) {
                    if (i == index) {
                      return CustomSvgImage(
                        assetName: 'assets/icons/filled-star-icon.svg',
                        color: theme.colorScheme.primary,
                        width: 16.0,
                      );
                    }
                  }
                  return CustomSvgImage(
                      assetName: 'assets/icons/filled-star-icon.svg',
                      width: 16.0,
                      color: theme.colorScheme.tertiary);
                },
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '$rating',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        Row(
          children: [
            CustomSvgImage(
              assetName: 'assets/icons/recomendations-icon.svg',
              width: 16.0,
              color: warningColor,
            ),
            SizedBox(width: 4.0),
            Text(
              '0',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            CustomSvgImage(
              assetName: 'assets/icons/argues-icon.svg',
              width: 16.0,
              color: successColor,
            ),
            SizedBox(width: 4.0),
            Text(
              '0',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
