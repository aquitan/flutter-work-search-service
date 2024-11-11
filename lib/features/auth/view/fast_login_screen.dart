import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class FastLoginScreen extends StatefulWidget {
  const FastLoginScreen({super.key, required this.value, required this.type});

  final String value;
  final String type;

  @override
  State<FastLoginScreen> createState() => _FastLoginScreenState();
}

class _FastLoginScreenState extends State<FastLoginScreen> {

  bool _otpError = false;

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
    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocStateOtpSuccess) {
          BlocProvider.of<AuthBloc>(context).add(FastAuth(type: widget.type));
          GetIt.I<Talker>().debug('success');
        }
        if (state is AuthBlocStateOtpFailure) {
          setState(() {
            _otpError = true;
          });
        }
        if (state is AuthBlocStateFastAuth) {
          GetIt.I<Talker>().debug('token ${state.token.accessToken}');

          AuthProvider().login();
        }
        if (state is AuthBlocStateFastAuthFailure) {
          GetIt.I<Talker>().debug('failure');
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
                    text: widget.type == 'email'
                        ? 'Мы отправили письмо с кодом на '
                        : 'Вам поступит звонок на номер ',
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
              widget.type == 'email'
                  ? 'Введите код'
                  : 'Введите последние 4 цифры входящего номера',
              textAlign: TextAlign.start,
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(
              height: 8,
            ),
            OtpFieldCustom(onSubmit: _submitOtp),
            if (_otpError)
              Text(
                'Неверный код',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.colorScheme.error),
              ),
            SizedBox(
              height: 32,
            ),
            Text(
              'Прислать новый код',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
