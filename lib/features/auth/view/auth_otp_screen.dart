import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
  bool codeError = false;

  void dismissTimer() {
    setState(() {
      _updateTimer = false;
    });
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
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocStateOtpFailure) {
          setState(() {
            codeError = true;
          });
          GetIt.I<Talker>().debug('Ошибка отправки кода!!!');
        } else if (state is AuthBlocStateOtpSuccess) {
          setState(() {
            codeError = false;
          });
          AutoRouter.of(context)
              .push(AuthRegisterRoute(value: widget.value, type: widget.type));
        }
      },
      child: Scaffold(
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
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge),
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
              if (codeError)
                Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text('Ошибка отправки кода, проверьте код!',
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.red)),
                  ],
                ),
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
          )),
    );
  }
}
