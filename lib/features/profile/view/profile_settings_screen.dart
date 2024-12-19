import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Настройки',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(width: 1, color: theme.colorScheme.tertiary)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.0,
                children: [
                  Text(
                    'Настройки безопасности',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text('Придумайте новый пароль с такими требованиями:'),
                  SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    spacing: 8.0,
                    children: [
                      CustomSvgImage(
                        assetName: 'assets/icons/check-circle-icon.svg',
                        color: theme.colorScheme.primary,
                      ),
                      Expanded(child: Text('Длина — не менее 8 символов;'))
                    ],
                  ),
                  Row(
                    spacing: 8.0,
                    children: [
                      CustomSvgImage(
                        assetName: 'assets/icons/check-circle-icon.svg',
                        color: theme.colorScheme.primary,
                      ),
                      Text('Заглавные буквы;')
                    ],
                  ),
                  Row(
                    spacing: 8.0,
                    children: [
                      CustomSvgImage(
                        assetName: 'assets/icons/check-circle-icon.svg',
                        color: theme.colorScheme.primary,
                      ),
                      Text('Строчные буквы;')
                    ],
                  ),
                  Row(
                    spacing: 8.0,
                    children: [
                      CustomSvgImage(
                        assetName: 'assets/icons/check-circle-icon.svg',
                        color: theme.colorScheme.primary,
                      ),
                      Expanded(
                          child: Text(
                              'Цифры или специальные символы: %, #, \$ и другие.'))
                    ],
                  ),
                  CustomTextfieldBordered(
                      filled: true,
                      label: 'Старый пароль',
                      controller: oldPasswordController),
                  CustomTextfieldBordered(
                      filled: true,
                      label: 'Новый пароль',
                      controller: newPasswordController),
                  CustomButton(
                      onTap: () {},
                      text: 'Сохранить',
                      radius: 56.0,
                      height: 56.0)
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(width: 1, color: theme.colorScheme.tertiary)),
              child: Column(
                spacing: 12.0,
                children: [
                  Text(
                    'Активные сессии',
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  ActiveSession(
                      type: 'desktop',
                      session: 'Текущая — Mac OS X, 10 декабря в 17:30',
                      browser: 'браузер Yandex Browser'),
                  ActiveSession(
                      type: 'mobile',
                      session: 'iPhone, 16 ноября в 18:07',
                      browser: 'браузер Chrome'),
                  SizedBox(
                    height: 8.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Выйти со всех устройств',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall!
                          .copyWith(color: theme.colorScheme.primary),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(width: 1, color: theme.colorScheme.tertiary)),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Удалить или отключить анкету',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(color: theme.colorScheme.tertiary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
