import 'package:flutter/material.dart';

class AuthTabSwitcher extends StatefulWidget {
  const AuthTabSwitcher({
    super.key,
  });

  @override
  State<AuthTabSwitcher> createState() => _AuthTabSwitcherState();
}

class _AuthTabSwitcherState extends State<AuthTabSwitcher>
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
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
                  width: 180,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Телефон',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )),
                Tab(
                    child: Container(
                  width: 180,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Email',
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
            width: double.maxFinite,
            height: 60,
            child: TabBarView(controller: _tabController, children: [
              TextFormField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                    prefixText: '+7',
                    labelText: 'Введите номер телефона'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Введите почту',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ]),
          ),
        )
      ],
    );
  }
}
