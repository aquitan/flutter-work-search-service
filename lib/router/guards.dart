import 'package:auto_route/auto_route.dart';
import 'package:ia_ma/router/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool loggedIn = pref.getBool('logged_in') ?? false;
    if (loggedIn) {
      resolver.next(true);
    } else {
      router.push(AuthRoute());
    }
  }
}
