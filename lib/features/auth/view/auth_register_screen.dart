

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/widgets/auth_tab_register_switcher.dart';
import 'package:ia_ma/ui/widgets/widgets.dart';

@RoutePage()
class AuthRegisterScreen extends StatefulWidget {
  const AuthRegisterScreen(
      {super.key, required this.value, required this.type});

  final String type;
  final String value;

  @override
  State<AuthRegisterScreen> createState() => _AuthRegisterScreen();
}

class _AuthRegisterScreen extends State<AuthRegisterScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNmaeController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController innController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    secondNmaeController.dispose();
    lastNameController.dispose();
    innController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 100,
          surfaceTintColor: theme.cardTheme.color,
          backgroundColor: theme.cardTheme.color,
          foregroundColor: theme.cardTheme.color,
          title: Logo(),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            ),
          )),
      body: AuthTabRegisterSwitcher(
          type: widget.type,
          value: widget.value,
          firstNameController: firstNameController,
          secondNmaeController: secondNmaeController,
          lastNameController: lastNameController,
          innController: innController,
          formKey: formKey),
    );
  }
}