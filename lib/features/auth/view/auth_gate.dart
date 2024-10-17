import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool? isAuth;

  @override
  void initState() {
    super.initState();

    setState(() {
      isAuth = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isAuth!) {
      return Scaffold(body: const SearchScreen());
    } else {
      return const AuthScreen();
    }
  }
}
