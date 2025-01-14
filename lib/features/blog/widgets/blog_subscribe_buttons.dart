import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class BlogSubscribeButtons extends StatelessWidget {
  const BlogSubscribeButtons({super.key, required this.subscribed});

  final bool subscribed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (subscribed) {
      return FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(primaryDimed),
        ),
        onPressed: () {},
        child: Text('Вы подписаны',
            style: theme.textTheme.titleSmall!
                .copyWith(color: theme.colorScheme.primary)),
      );
    } else {
      return CustomButton(
          onTap: () {}, text: 'Подписаться', radius: 56.0, height: 56.0);
    }
  }
}
