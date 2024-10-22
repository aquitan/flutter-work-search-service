import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthPasswordScreen extends StatefulWidget {
  const AuthPasswordScreen({super.key});

  @override
  State<AuthPasswordScreen> createState() => _AuthPasswordScreenState();
}

class _AuthPasswordScreenState extends State<AuthPasswordScreen> {


  void onTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FastLoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          title: Logo(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: theme.primaryColor,
            ),
          )),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: 24,
          ),
          Text(
            'Вход в аккаунт',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 24,
          ),
          RichText(
              text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text: 'Введите пароль к аккаунту \n',
                  children: [TextSpan(text: 'artstudio@email.com')])),
          SizedBox(
            height: 12,
          ),
          Form(
              child: Column(
            children: [
              CustomTextfield(
                label: 'Пароль',
                obscure: true,
                isPassword: true,
              )
            ],
          )),
          SizedBox(
            height: 24,
          ),
          CustomButton(
            onTap: () {},
            text: 'Войти',
            radius: 24,
            height: 48,
          ),
          SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RestorePasswordScreen()));
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
              onTap();
            },
            child: Text(
              'Быстрый вход по коду',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
