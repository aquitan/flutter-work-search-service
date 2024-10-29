import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthOtpCheckScreen extends StatefulWidget {
  const AuthOtpCheckScreen(
      {super.key, required this.type, required this.value});

  final String type;
  final String value;

  @override
  State<AuthOtpCheckScreen> createState() => _AuthOtpCheckScreenState();
}

class _AuthOtpCheckScreenState extends State<AuthOtpCheckScreen> {
  bool _updateTimer = false;


  void dismissTimer() {
    setState(() {
      _updateTimer = false;
    });
  }


  @override
  void initState() {
    BlocProvider.of<AuthBloc>(context)
        .add(GetConfirmCode(value: widget.value, type: widget.type));
    super.initState();
  }

  void _submitOtp(String verificationCode) {
    BlocProvider.of<AuthBloc>(context).add(SendConfirmCodeResponse(
      type: widget.type,
      value: widget.value,
      code: int.parse(verificationCode),
    ));
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
            Text(
                widget.type == 'phone'
                    ? 'Подтверждение телефона \n'
                    : 'Подтверждение почты \n',
                textAlign: TextAlign.center, style: theme.textTheme.titleLarge),
            SizedBox(
              height: 28,
            ),
            RichText(
                text: TextSpan(
                    text: widget.type == 'phone'
                        ? 'Вам поступит звонок на номер\n '
                        : 'На вашу почту придет код подтверждения \n',
                    style: theme.textTheme.bodyMedium,
                    children: [
                  TextSpan(
                      text: widget.value,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                ])),
            SizedBox(
              height: 28,
            ),
            Text(
                widget.type == 'phone'
                    ? 'Введите последние 4 цифры входящего номера'
                    : 'Введите код из письма',
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
}
