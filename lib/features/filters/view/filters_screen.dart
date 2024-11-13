import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  void onLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Фильтры'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              onLogout();
              AutoRouter.of(context).replaceAll([AuthRoute()]);
            },
            child: Text('Выход')),
      ),
    );
  }
}
