import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class ProfileNotificationsScreen extends StatefulWidget {
  const ProfileNotificationsScreen({super.key});

  @override
  State<ProfileNotificationsScreen> createState() =>
      _ProfileNotificationsScreenState();
}

class _ProfileNotificationsScreenState
    extends State<ProfileNotificationsScreen> {
  bool notifications = false;
  bool addvert = false;
  bool blog = false;

  void onChangeNotifications(bool value) {
    setState(() {
      notifications = !notifications;
    });
  }

  void onChangeAdvert(bool value) {
    setState(() {
      addvert = !addvert;
    });
  }

  void onChangeBlog(bool value) {
    setState(() {
      blog = !blog;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Уведомления',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    color: theme.colorScheme.tertiaryFixedDim,
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                        width: 1, color: theme.colorScheme.tertiary)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12.0,
                  children: [
                    Text(
                      'Уведомления от приложения',
                      style: theme.textTheme.titleMedium,
                    ),
                    Row(
                      spacing: 8.0,
                      children: [
                        AvatarIcon(
                          iconAsset: 'assets/icons/bell-alert-icon.svg',
                        ),
                        Expanded(
                            child: Text('Показывать мгновенные уведомления')),
                        if (theme.isAndroid)
                          Switch(
                              value: notifications,
                              onChanged: onChangeNotifications)
                        else
                          CupertinoSwitch(
                              value: notifications,
                              onChanged: onChangeNotifications)
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      spacing: 4.0,
                      children: [
                        AvatarIcon(
                            iconAsset: 'assets/icons/newspaper-icon.svg'),
                        Expanded(child: Text('Уведосления от стройжурнала')),
                        if (theme.isAndroid)
                          Switch(value: blog, onChanged: onChangeBlog)
                        else
                          CupertinoSwitch(value: blog, onChanged: onChangeBlog)
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      spacing: 4.0,
                      children: [
                        AvatarIcon(
                          iconAsset: 'assets/icons/gift-icon.svg',
                        ),
                        Expanded(
                            child: Text('Рекламный контент и предложения')),
                        if (theme.isAndroid)
                          Switch(value: addvert, onChanged: onChangeAdvert)
                        else
                          CupertinoSwitch(
                              value: addvert, onChanged: onChangeAdvert)
                      ],
                    ),
                  ],
                )),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(width: 1, color: theme.colorScheme.tertiary)),
              child: Column(
                spacing: 12.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Подписка на аукцион',
                    style: theme.textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Письма на почту'),
                      if (theme.isAndroid)
                        Switch(value: addvert, onChanged: onChangeAdvert)
                      else
                        CupertinoSwitch(
                            value: addvert, onChanged: onChangeAdvert)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryFixedDim,
                  borderRadius: BorderRadius.circular(24.0),
                  border:
                      Border.all(width: 1, color: theme.colorScheme.tertiary)),
              child: Column(
                spacing: 12.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Новостная рассылка',
                    style: theme.textTheme.titleMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Письма на почту'),
                      if (theme.isAndroid)
                        Switch(value: addvert, onChanged: onChangeAdvert)
                      else
                        CupertinoSwitch(
                            value: addvert, onChanged: onChangeAdvert)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            CustomButton(
                onTap: () {}, text: 'Сохранить', radius: 56.0, height: 56.0)
          ],
        ),
      ),
    );
  }
}
