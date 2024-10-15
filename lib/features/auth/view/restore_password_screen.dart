import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class RestorePasswordScreen extends StatefulWidget {
  const RestorePasswordScreen({super.key});

  @override
  State<RestorePasswordScreen> createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  bool _updateTimer = false;

  void dismissTimer() {
    setState(() {
      print('dismissTimer');
      _updateTimer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
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
          )),
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
                style: theme.bodyLarge!.copyWith(
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
