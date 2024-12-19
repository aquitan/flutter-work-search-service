import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/profile/widgets/widgets.dart';

@RoutePage()
class ProfileVerificationScreen extends StatefulWidget {
  const ProfileVerificationScreen({super.key});

  @override
  State<ProfileVerificationScreen> createState() =>
      _ProfileVerificationScreenState();
}

class _ProfileVerificationScreenState extends State<ProfileVerificationScreen> {
  final TextEditingController passportSeriesController =
      TextEditingController();
  final TextEditingController passportNumberController =
      TextEditingController();

  final List<Map<String, dynamic>> connectList = [
    {'icon': 'assets/icons/gosuslugi.svg', 'name': 'Госуслуги'},
    {'icon': 'assets/icons/t-bank.svg', 'name': 'T-ID'},
    {'icon': 'assets/icons/ok.svg', 'name': 'Другой способ'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Верификация личности',
          style: theme.textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(children: <Widget>[
          // Screen Title ////////////////////////////////////////////////////////////
          Text('Проверка паспорта', style: theme.textTheme.titleMedium),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'Для проверки паспорта введите серию и номер документа, затем подтвердите данные через один из аккаунтов ниже, в котором вы зарегистрированы.',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(
            height: 12.0,
          ),

          // Verification TextFields ///////////////////////////////////////////
          ProfileVerificationForm(
              passportSeriesController: passportSeriesController,
              passportNumberController: passportNumberController),
          SizedBox(
            height: 24.0,
          ),
          // Profile Verification Variants //////////////////////////////////////
          Text(
            'Подтверждение через аккаунты',
            style: theme.textTheme.titleMedium,
          ),
          SizedBox(
            height: 12.0,
          ),
          Text(
            'Необходимо сверить паспортные данные с данными из ваших верификационных аккаунтов. Выберите любой из предложенных.',
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(
            height: 12.0,
          ),
          SocialConnectList(
            connectList: connectList,
          )
        ]),
      ),
    );
  }
}
