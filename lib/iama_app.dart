import 'package:flutter/material.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/theme.dart';

class IamaApp extends StatefulWidget {
  const IamaApp({super.key});

  @override
  State<IamaApp> createState() => _IamaAppState();
}

class _IamaAppState extends State<IamaApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'YaMa',
      theme: lightThemeData,
      routerConfig: appRouter.config(),
      // routes: {
      //   '/': (context) => const HomeScreen(),
      // },
      // home: const AuthGate(),
    );
  }
}
