import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/view.dart';

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
      isAuth = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isAuth!) {
      return const Placeholder();
    } else {
      return const AuthScreen();
    }
  }
}
