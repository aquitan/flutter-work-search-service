import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthPasswordScreen extends StatefulWidget {
  const AuthPasswordScreen(
      {super.key,
      required this.value,
      required this.type,
      this.isCompany,
      this.firstName,
      this.lastName,
      this.middleName});

  final String value;
  final String type;
  final bool? isCompany;
  final String? firstName;
  final String? lastName;
  final String? middleName;

  @override
  State<AuthPasswordScreen> createState() => _AuthPasswordScreenState();
}

class _AuthPasswordScreenState extends State<AuthPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool error = false;

  void onSignIn() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignIn(
          value: widget.value,
          type: widget.type,
          password: _passwordController.text,
          login: widget.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthBlocPasswordFailure) {
          setState(() {
            error = true;
          });
        }
        if (state is AuthSigninSuccess) {
          AutoRouter.of(context).replaceAll([HomeRoute()]);
        }
      },
      child: Scaffold(
        backgroundColor: theme.cardTheme.color,
          appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 100,
            surfaceTintColor: theme.cardTheme.color,
            backgroundColor: theme.cardTheme.color,
            foregroundColor: theme.cardTheme.color,
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
          padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Вход в аккаунт',
                style: theme.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              RichText(
                  text: TextSpan(
                      style: theme.textTheme.bodyMedium,
                      text: 'Введите пароль к аккаунту \n',
                      children: [
                    TextSpan(
                        text: widget.value, style: theme.textTheme.titleMedium)
                  ])),
              SizedBox(
                height: 12,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                children: [
                  TextFormField(
                        obscuringCharacter: '*',
                    controller: _passwordController,
                        validator: (String? value) => _validatePassword(value!),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: obscureText
                              ? SvgPicture.asset('assets/icons/eye-icon.svg')
                              : SvgPicture.asset('assets/icons/eye-closed.svg'),
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: theme.dividerColor)),
                        labelText: 'Пароль'),
                    obscureText: obscureText,

                      ),
                    if (error)
                        Text(
                          textAlign: TextAlign.start,
                          'Ошибка, проверьте пароль',
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: theme.colorScheme.error),
                        ),
                  // CustomTextfield(
                  //   validation: (value) => null,
                  //   label: 'Пароль',
                  //   obscure: true,
                  //   isPassword: true,
                      // )
                      SizedBox(
                        height: 24,
                      ),
                      CustomButton(
                        onTap: () {
                          onSignIn();
                        },
                        text: 'Войти',
                      radius: 56,
                      height: 56,
                      ),
                    ],
                  )),

              SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(RestorePasswordRoute(
                    value: widget.value,
                    type: widget.type,
                  ));
                },
                child: Text(
                  'Забыли пароль',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(
                      FastLoginRoute(type: widget.type, value: widget.value));
                },
                child: Text(
                  'Быстрый вход по коду',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.primaryColor),
                ),
              ),
            ],
          ),
      ),

    );
  }

  String? _validatePassword(String value) {
    print('value: $value');
    if (value.isEmpty) {
      return 'Введите пароль';
    } else if (value.length < 8) {
      return 'Пароль должен содержать не менее 8 символов';
    } else {
      return null;
    }
  }
}
