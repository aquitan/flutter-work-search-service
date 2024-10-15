import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ia_ma/ui/widgets/otp_field_custom.dart';

class FastLoginScreen extends StatefulWidget {
  const FastLoginScreen({super.key});

  @override
  State<FastLoginScreen> createState() => _FastLoginScreenState();
}

class _FastLoginScreenState extends State<FastLoginScreen> {
  final value = 'Ivan@email.com';

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
              color: Theme.of(context).primaryColor,
            ),
          )
      ),
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
          Text(
            'Мы отправили письмо с кодом на \n $value',
            textAlign: TextAlign.start,
            style: theme.textTheme.bodyMedium,
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            'Введите код',
            textAlign: TextAlign.start,
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 8,
          ),
          OtpFieldCustom(onSubmit: () {}),

          SizedBox(
            height: 32,
          ),
          Text('Прислать новый код',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColor),)
        ],
      ),
    );
  }
}