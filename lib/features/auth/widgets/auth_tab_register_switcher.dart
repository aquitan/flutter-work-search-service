import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

class AuthTabRegisterSwitcher extends StatefulWidget {
  const AuthTabRegisterSwitcher({
    super.key,
  });

  @override
  State<AuthTabRegisterSwitcher> createState() => _AuthTabRegisterSwitcher();
}

class _AuthTabRegisterSwitcher extends State<AuthTabRegisterSwitcher>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNmaeController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _innController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _tabController.dispose();
    _firstNameController.dispose();
    _secondNmaeController.dispose();
    _lastNameController.dispose();
    _innController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      AutoRouter.of(context)
          .push(AuthPasswordRoute(value: 'моковые данные заменить!'));
    }

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: EdgeInsets.only(left: 16, right: 16),
      children: [
        SizedBox(
          height: 24,
        ),
        Text(
          'Давайте познакомимся',
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 32,
        ),
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(24)),
          child: TabBar(
              indicatorPadding: EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              labelColor: theme.tabBarTheme.labelColor,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: theme.cardTheme.color,
                  border: Border.all(width: 2, color: theme.primaryColor)),
              dividerHeight: 0,
              tabs: [
                Tab(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Физическое лицо',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )),
                Tab(
                    child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Юридическое лицо',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ))
              ]),
        ),
        SizedBox(
          height: 24,
        ),
        Form(
            key: _formKey,
            child: SizedBox(
              height: 250,
          child: TabBarView(controller: _tabController, children: [
                ListView(
              children: [
                CustomTextfield(
                      validation: (value) => _lastNameValidation(value),
                      controller: _lastNameController,
                  label: 'Фамилия',
                  enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.dividerColor)),
                ),
                    SizedBox(height: 8),
                CustomTextfield(
                      validation: (value) => _firstNameValidation(value),
                      controller: _firstNameController,
                  label: 'Имя',
                  enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.dividerColor)),
                ),
                    SizedBox(height: 8),
                CustomTextfield(
                      validation: (value) => null,
                      controller: _secondNmaeController,
                  label: 'Отчество',
                  enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: theme.dividerColor)),
                ),
              ],
            ),
                ListView(children: [
                  CustomTextfield(
                    controller: _innController,
                    validation: (value) => _innValidation(value),
                    label: 'ИНН компании',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: theme.dividerColor)),
                  ),
                  SizedBox(height: 8),
                  CustomTextfield(
                    validation: (value) => null,

                    label: 'Наименование компании',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: theme.dividerColor)),
                  ),
                ])
          ]),
        )),
        SizedBox(
          height: 32,
        ),
        CustomButton(
          onTap: () => _register(),
          text: 'Создать аккаунт',
          radius: 24,
          height: 48,
        ),
      ],
    );
  }

  String? _firstNameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Введите имя';
    } else if (value.length < 2) {
      return 'Имя должно быть длиннее 2 символов';
    } else {
      return null;
    }
  }

  String? _lastNameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Введите фамилию';
    } else if (value.length < 2) {
      return 'Фамилия должна быть длиннее 2 символов';
    } else {
      return null;
    }
  }

  String? _innValidation(String? value) {
    // Вычисление контрольной суммы
    // var sum = 0;
    // for (int i = 0; i < 9; i++) {
    //   sum += int.parse(value![i]) * (10 - i);
    // }

    // // Контрольная сумма должна совпадать с последней цифрой ИНН
    // var controlNumber = (sum % 11) % 10;

    if (value!.isEmpty) {
      return 'Введите ИНН';
    } else if (value.length < 10) {
      return 'ИНН должен быть не менее 10 символов';
    } else {
      return null;
    }
  }
}
