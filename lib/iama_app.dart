import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/auth_gate.dart';
import 'package:ia_ma/ui/theme.dart';

class IamaApp extends StatelessWidget {
  const IamaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YaMa',
      theme: lightThemeData,
      routes: {
        '/': (context) => const AuthGate(),
      },
      // home: const AuthGate(),
    );
  }
}
