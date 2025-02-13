import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/widgets/widgets.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardTheme.color,
      body: CheckLogin(),
      // body: AuthOtpCheck(),
    );
  }
}