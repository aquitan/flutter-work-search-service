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
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
          child: TabBar(
              controller: _tabController,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              labelColor: Colors.grey,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.white,
                  border: Border.all(width: 1, color: theme.primaryColor)),
              dividerHeight: 0,
              tabs: [
                Tab(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Телефон',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )),
                Tab(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
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
          child: Container(
            width: double.maxFinite,
            height: 60,
            child: TabBarView(controller: _tabController, children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixText: '+7', labelText: 'Введите номер телефона'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Введите почту'),
                keyboardType: TextInputType.emailAddress,
              ),
            ]),
          ),
        )
      ],
    );
  }
}
