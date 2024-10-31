import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/features/auth/widgets/widgets.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class CheckLogin extends StatefulWidget {
  const CheckLogin({super.key});

  @override
  State<CheckLogin> createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  bool _authTypesVisible = false;
  String type = 'phone';
  String value = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final _authBlock = AuthBloc(GetIt.I<AbstractAuthRepository>());

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onTap() {
      if (_formKey.currentState!.validate()) {
        if (type == 'phone') {
          value = _phoneController.text;
        } else {
          value = _emailController.text;
        }

        BlocProvider.of<AuthBloc>(context)
            .add(CheckLoginEvent(value: value, type: type));
      }
    }

    void onChangeType(int val) {
      setState(() {
        if (val == 0) {
          type = 'phone';
          value = _phoneController.text;
        } else if (val == 1) {
          type = 'email';
          value = _emailController.text;
        }
      });
    }

    void showAuthTypes() {
      setState(() {
        _authTypesVisible = !_authTypesVisible;
      });
    }

    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocStateChecked) {
          AutoRouter.of(context)
              .push(AuthPasswordRoute(value: value, type: type));
        }
        if (state is AuthBlocStateFailure) {
          BlocProvider.of<AuthBloc>(context)
              .add(GetConfirmCode(value: value, type: type));
          AutoRouter.of(context)
              .push(AuthOtpCheckRoute(type: type, value: value));

        }
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: ListView(
            children: [
              Logo(),
              SizedBox(
                height: 28,
              ),
              Text(
                'Вход и регистрация',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Jost',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              AuthTabSwitcher(
                  onChangeType: (int val) => onChangeType(val),
                  formKey: _formKey,
                  emailController: _emailController,
                  phoneController: _phoneController),
              SizedBox(
                height: 32,
              ),
              CustomButton(
                text: 'Вход',
                radius: 24,
                height: 48,
                onTap: () {
                  onTap();
                },
              ),
              SizedBox(
                height: 12,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                    text: 'Продолжая, вы соглашаетесь с',
                    children: [
                      TextSpan(
                          text: ' Политикой конфиденциальности',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).primaryColor)),
                      TextSpan(
                        text: ' и ',
                      ),
                      TextSpan(
                          text: 'условиями использования',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).primaryColor))
                    ]),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  'Или через',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/google.svg'),
                      color: Colors.red),
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/vk.svg'),
                      color: Colors.blue),
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/yandex.svg'),
                      color: Colors.red),
                  AuthTypes(
                      icon: SvgPicture.asset('assets/icons/apple.svg'),
                      color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showAuthTypes();
                    },
                    child: AuthTypes(
                        icon: SvgPicture.asset('assets/icons/chevron-down.svg'),
                        color: const Color.fromARGB(255, 236, 234, 234)),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              if (_authTypesVisible)
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: [
                    AuthTypes(
                        icon: SvgPicture.asset('assets/icons/gosuslugi.svg'),
                        color: const Color.fromARGB(255, 239, 238, 238)),
                    AuthTypes(
                        icon: SvgPicture.asset('assets/icons/mail.svg'),
                        color: Colors.blue),
                    AuthTypes(
                        icon: SvgPicture.asset('assets/icons/ok.svg'),
                        color: Colors.orange),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
