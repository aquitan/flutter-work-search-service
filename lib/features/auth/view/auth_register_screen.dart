

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/widgets/auth_tab_register_switcher.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen({super.key});

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreen();
}

class _AuthRegisterScreen extends State<AuthRegisterScreen> {
  @override
  Widget build(BuildContext context) {

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
              color: Theme.of(context).primaryColor,
            ),
          )
      ),
      body: AuthTabRegisterSwitcher(),
    );
  }
}