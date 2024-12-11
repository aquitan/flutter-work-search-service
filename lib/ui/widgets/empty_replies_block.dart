import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyRepliesBlock extends StatelessWidget {
  const EmptyRepliesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.start,
              'Пока никто не откликнулся',
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(
              height: 24.0,
            ),
            SvgPicture.asset('assets/icons/empty-page.svg'),
          ],
        ));
  }
}
