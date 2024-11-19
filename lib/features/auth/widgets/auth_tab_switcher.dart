import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTabSwitcher extends StatefulWidget {
  const AuthTabSwitcher({
    super.key,
      this.emailController,
      this.phoneController,
      required this.onChangeType,
      required this.formKey
  });

  final TextEditingController? emailController;
  final TextEditingController? phoneController;
  final GlobalKey<FormState> formKey;
  final Function(int) onChangeType;

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
              onTap: (value) => widget.onChangeType(value),
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
          key: widget.formKey,
          child: SizedBox(
            width: double.maxFinite,
            height: 80,
            child: TabBarView(controller: _tabController, children: [
              TextFormField(
                controller: widget.phoneController,
                validator: (value) => _validatePhone(value),
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: theme.dividerColor)),
                    prefixText: '+7',
                    labelText: 'Введите номер телефона'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,10}$'),
                      allow: true),
                ],
              ),
              TextFormField(
                controller: widget.emailController,
                validator: (String? value) => _validateEmail(value),
                decoration: InputDecoration(
                  labelText: 'Введите почту',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: theme.dividerColor)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),

            ]),
          ),
        )
      ],
    );
  }

  String? _validateEmail(String? value) {
    final phoneExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (value!.isEmpty) {
      return 'Введите почту';
    } else if (!phoneExp.hasMatch(widget.emailController!.text)) {
      return 'Введите корректный email';
    } else {
      return null;
    }
  }

  String? _validatePhone(String? value) {
    if (value!.isEmpty) {
      return 'Введите номер телефона';
    } else if (value.length < 10) {
      return 'Введите корректный номер телефона';
    } else {
      return null;
    }
  }
}
