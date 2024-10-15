import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/widgets/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckLogin(),
      // body: AuthOtpCheck(),
    );
  }
}