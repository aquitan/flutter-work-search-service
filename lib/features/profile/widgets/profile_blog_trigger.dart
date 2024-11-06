import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfileBlogTrigger extends StatelessWidget {
  const ProfileBlogTrigger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Мой стройжунал',
                style: theme.textTheme.titleLarge,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                  'Вы мастер — поделитесь вашими работами, экспертным мнением, прикрепляйте фото и видео.'),
              SizedBox(
                height: 4,
              ),
              Text(
                  'Вы заказчик — похвастайтесь новым ремонтом, расскажите как удалось решить задачу и найти мастеров.')
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: theme.cardTheme.color,
                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ]),
            child: Row(
              children: [
                CustomAvatar(
                  bordered: true,
                  radius: 20,
                  networkImg:
                      'https://i.pinimg.com/736x/8c/ed/f9/8cedf96e02c73abda694f5d0bc6f6990.jpg',
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Напишите о вашем проекте',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.secondary),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
