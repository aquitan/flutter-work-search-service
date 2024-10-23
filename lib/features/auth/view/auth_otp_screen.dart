import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthOtpCheckScreen extends StatefulWidget {
  const AuthOtpCheckScreen({super.key});

  @override
  State<AuthOtpCheckScreen> createState() => _AuthOtpCheckScreenState();
}

class _AuthOtpCheckScreenState extends State<AuthOtpCheckScreen> {
  bool _updateTimer = false;

  void dismissTimer() {
    setState(() {
      print('dismissTimer');
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
        backgroundColor: theme.scaffoldBackgroundColor,
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: [
            SizedBox(
              height: 28,
            ),
            Text('Подтверждение номера телефона',
                textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
            SizedBox(
              height: 28,
            ),
            RichText(
                text: TextSpan(
                    text: 'Вам поступит звонок на номер\n ',
                    style: theme.textTheme.bodyMedium,
                    children: [
                  TextSpan(
                      text: '+7 910 ***-**-**-13',
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                ])),
            SizedBox(
              height: 28,
            ),
            Text('Введите последние 4 цифры входящего номера',
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
        ));
  }

  void _submitOtp(String verificationCode) {
    AutoRouter.of(context).push(AuthRegisterRoute());
  }
}
