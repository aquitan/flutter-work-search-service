import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen(
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
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool error = false;

  void onTap() {
    if (_formKey.currentState!.validate()) {
      GetIt.I<Talker>().debug('Регистрация в аккаунт');
      BlocProvider.of<AuthBloc>(context).add(SignUp(
        value: widget.value,
        type: widget.type,
        firstName: widget.firstName,
        lastName: widget.lastName,
        middleName: widget.middleName,
        password: _passwordController.text,
        companyName: '',
        isCompany: false,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AuthBloc, AuthBlocState>(
      listener: (context, state) {
        if (state is AuthSignupSuccess) {
          AutoRouter.of(context).replaceAll([HomeRoute()]);
        } else {
          setState(() {
            error = true;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                'Регистрация нового аккаунта',
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
                                  ? SvgPicture.asset(
                                      'assets/icons/eye-icon.svg')
                                  : SvgPicture.asset(
                                      'assets/icons/eye-closed.svg'),
                            ),
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: theme.dividerColor)),
                            labelText: 'Пароль'),
                        obscureText: obscureText,
                      ),
                      if (state is AuthBlocPasswordFailure)
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
                          onTap();
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
              Text(
                'Пароль должен быть длиной не менее 8 символов. Он должен состоять только из символов латинского алфавита и содержать как минимум одну цифру, специальный символ, строчную и заглавную буквы.',
                style: theme.textTheme.bodySmall,
              )
            ],
          ),
        );
      },
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
