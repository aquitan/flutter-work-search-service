import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class ProfileBlogTrigger extends StatelessWidget {
  const ProfileBlogTrigger({
    super.key,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  final String? firstName;
  final String? lastName;
  final String? avatar;


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
            ),
            child: Row(
              children: [
                CustomAvatar(
                  bordered: true,
                  radius: 20,
                  initials: '${firstName![0]}${lastName?[0] ?? ''}',
                  networkImg: avatar != null
                      ? '${dotenv.env['YA_MA_CDN']}$avatar'
                      : null,
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
