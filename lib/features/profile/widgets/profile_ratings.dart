import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileRatings extends StatelessWidget {
  const ProfileRatings({
    super.key,
    this.rating = 0,
    required this.recomendations,
  });

  final int rating;
  final int recomendations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
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
                      return SvgPicture.asset(
                        'assets/icons/filled-star-icon.svg',
                        width: 16.0,
                      );
                    }
                  }
                  return SvgPicture.asset('assets/icons/filled-star-icon.svg',
                      width: 16.0,
                      colorFilter: ColorFilter.mode(
                          theme.colorScheme.tertiary, BlendMode.srcIn));
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
            SvgPicture.asset(
              'assets/icons/recomendations-icon.svg',
              width: 16.0,
            ),
            SizedBox(width: 4.0),
            Text(
              '$recomendations',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/argues-icon.svg',
              width: 16.0,
            ),
            SizedBox(width: 4.0),
            Text(
              '0 споров',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
