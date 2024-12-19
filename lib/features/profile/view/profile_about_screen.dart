import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/avatar_icon.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class ProfileAboutScreen extends StatelessWidget {
  const ProfileAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'О приложении',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: ListView(
            children: [
              Text(
                '© 2024 — ООО «ЯМастер. Биржа строительства и ремонта».',
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 24.0),
              Text(
                'Наши соцсети',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 12.0),
              Row(
                spacing: 12.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse(
                          'https://dzen.ru/id/65e9993f3c952045d3023405');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: AvatarIcon(iconAsset: 'assets/icons/dzen.svg'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://vk.com/ya.ma_ru');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: AvatarIcon(iconAsset: 'assets/icons/vk.svg'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url = Uri.parse('https://t.me/ya_ma_ru');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: AvatarIcon(iconAsset: 'assets/icons/tg.svg'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://ok.ru/group/70000005023754');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: AvatarIcon(iconAsset: 'assets/icons/ok.svg'),
                  )
                ],
              )
            ],
          )),
    );
  }
}
