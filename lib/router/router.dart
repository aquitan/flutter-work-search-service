import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/features/home/view/home_screen.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: AuthOtpCheckRoute.page),
        AutoRoute(page: AuthPasswordRoute.page),
        AutoRoute(page: AuthRegisterRoute.page),
        AutoRoute(page: FastLoginRoute.page),
        AutoRoute(page: RestorePasswordRoute.page),
        AutoRoute(
            page: HomeRoute.page,
            initial: true,
            path: '/',
            guards: [AuthGuard()])
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}

class AuthGuard extends AutoRouteGuard {
  final bool authenticated = true;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (authenticated) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(AuthRoute());
    }
  }
}

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
