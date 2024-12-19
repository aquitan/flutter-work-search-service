import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:ia_ma/ui/widgets/custom_avatar.dart';

class ProfilePersonalAvatar extends StatelessWidget {
  const ProfilePersonalAvatar({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      spacing: 16.0,
      children: [
        CustomAvatar(
          radius: 40.0,
          isOnline: true,
          bordered: true,
          initials: '${user.firstName![0]}${user.lastName?[0] ?? ''}',
          networkImg: user.avatar != null
              ? '${dotenv.env['YA_MA_CDN']}${user.avatar}'
              : null,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'Добавить фото',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.colorScheme.secondary),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Удалить фото',
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: theme.colorScheme.error),
              ),
            ),
          ],
        )
      ],
    );
  }
}
