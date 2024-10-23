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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _register() {
    AutoRouter.of(context).push(AuthPasswordRoute());
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => AuthPasswordScreen(),
    //     ));
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
            child: SizedBox(
          height: 200,
          child: TabBarView(controller: _tabController, children: [
            Column(
              children: [
                CustomTextfield(
                  label: 'Фамилия',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                ),
                CustomTextfield(
                  label: 'Имя',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                ),
                CustomTextfield(
                  label: 'Отчество',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                ),
              ],
            ),
            CustomTextfield(
              label: 'Наименование компании',
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26)),
            ),
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
}
