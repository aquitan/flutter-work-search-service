import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class AuthPasswordScreen extends StatefulWidget {
  const AuthPasswordScreen({super.key});

  @override
  State<AuthPasswordScreen> createState() => _AuthPasswordScreenState();
}

class _AuthPasswordScreenState extends State<AuthPasswordScreen> {
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
          title: SvgPicture.asset('assets/logo/logo.svg'),
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
