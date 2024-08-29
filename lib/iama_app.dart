import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/auth_register_screen.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/ui/theme.dart';

class IamaApp extends StatelessWidget {
  const IamaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightThemeData,
      // home: AuthScreen(),
      home: AuthRegisterScreen(),
    );
  }
}
