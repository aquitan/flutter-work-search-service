import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class AuthOtpCheck extends StatefulWidget {
  const AuthOtpCheck({super.key});

  @override
  State<AuthOtpCheck> createState() => _AuthOtpCheckState();
}

class _AuthOtpCheckState extends State<AuthOtpCheck> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: SvgPicture.asset('assets/logo/logo.svg'),
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
        backgroundColor: Colors.white,
        body: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: [
            SizedBox(
              height: 28,
            ),
            Text('Подтверждение номера телефона',
                textAlign: TextAlign.center, style: theme.titleLarge),
            SizedBox(
              height: 28,
            ),
            RichText(
                text: TextSpan(
                    text: 'Вам поступит звонок на номер\n ',
                    style: theme.bodyMedium,
                    children: [
                  TextSpan(
                      text: '+7 910 ***-**-**-13',
                      style: theme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                ])),
            SizedBox(
              height: 28,
            ),
            Text('Введите последние 4 цифры входящего номера',
                textAlign: TextAlign.left,
                style: theme.bodySmall!.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(
              height: 12,
            ),
            OtpFieldCustom(onSubmit: _showDialog),
            SizedBox(
              height: 28,
            ),
            Text('Позвонить повторно',
                textAlign: TextAlign.center,
                style: theme.bodyLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ));
  }

  void _showDialog(String verificationCode) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Verification Code"),
            content: Text('Code entered is $verificationCode'),
          );
        });
  }
}
