import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(24)),
          child: TabBar(
              padding: EdgeInsets.all(0),
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
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Физическое лицо',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
                      ),
                    )),
                Tab(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Юридическое лицо',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
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
              Text('Укажите реальную информацию о себе'),
              Text('Укажите название вашей компании')
            ]),
          ),
        )
      ],
    );
  }
}
