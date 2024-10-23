import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/router/router.dart';
import 'package:ia_ma/ui/theme/theme.dart';
import 'package:talker_flutter/talker_flutter.dart';

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
      routerConfig: appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
      // routes: {
      //   '/': (context) => const HomeScreen(),
      // },
    );
  }
}
