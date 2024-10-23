import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class RestorePasswordScreen extends StatefulWidget {
  const RestorePasswordScreen({super.key});

  @override
  State<RestorePasswordScreen> createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  bool _updateTimer = false;

  final String type = 'email';
  final String value = 'sukharevsky@ia-ma.ru';

  void dismissTimer() {
    setState(() {
      _updateTimer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          surfaceTintColor: theme.scaffoldBackgroundColor,
          backgroundColor: theme.scaffoldBackgroundColor,
          foregroundColor: theme.scaffoldBackgroundColor,
          title: Logo(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16),
        children: [
          SizedBox(
            height: 28,
          ),
          Text('Восстановление пароля',
              textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
          SizedBox(
            height: 28,
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
              type == 'email'
                  ? 'Введите код'
                  : 'Введите последние 4 цифры входящего номера',
              textAlign: TextAlign.left,
              style: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.w600)),
          SizedBox(
            height: 12,
          ),
          OtpFieldCustom(onSubmit: _submitOtp),
          SizedBox(
            height: 28,
          ),
          CountDownTimer(dismissTimer: dismissTimer),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              setState(() {
                _updateTimer = true;
              });
            },
            child: Text('Позвонить повторно',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ],
      ),
    );
  }

  void _submitOtp(String verificationCode) {}
}
