import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileRatings extends StatelessWidget {
  const ProfileRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/filled-star-icon.svg',
              width: 16.0,
            ),
            SvgPicture.asset(
              'assets/icons/filled-star-icon.svg',
              width: 16.0,
            ),
            SvgPicture.asset(
              'assets/icons/filled-star-icon.svg',
              width: 16.0,
            ),
            SvgPicture.asset(
              'assets/icons/filled-star-icon.svg',
              width: 16.0,
            ),
            SvgPicture.asset(
              'assets/icons/filled-star-icon.svg',
              width: 16.0,
            ),
            Text(
              '4.5',
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
              '4 рекомендации',
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
