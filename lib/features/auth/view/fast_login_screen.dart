import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class FastLoginScreen extends StatefulWidget {
  const FastLoginScreen({super.key});

  @override
  State<FastLoginScreen> createState() => _FastLoginScreenState();
}

class _FastLoginScreenState extends State<FastLoginScreen> {
  final String value = 'Ivan@email.com';
  final String type = 'email';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: Logo(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          )
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: 32,
          ),
          Text(
            'Вход по коду',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge,
          ),
          SizedBox(
            height: 32,
          ),
          RichText(
              text: TextSpan(
                  text: 'Мы отправили письмо с кодом на ',
                  style: theme.textTheme.bodyMedium,
                  children: [
                TextSpan(
                    text: 'sukharevsky@ia-ma.ru',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w600)),
              ])),
          SizedBox(
            height: 28,
          ),
          Text(
            'Введите код',
            textAlign: TextAlign.start,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 8,
          ),
          OtpFieldCustom(onSubmit: () {}),

          SizedBox(
            height: 32,
          ),
          Text(
            'Прислать новый код',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),)
        ],
      ),
    );
  }
}