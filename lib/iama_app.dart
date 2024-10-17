import 'package:flutter/material.dart';
import 'package:ia_ma/features/home/view/home_screen.dart';
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
        '/': (context) => const HomeScreen(),
      },
      // home: const AuthGate(),
    );
  }
}
