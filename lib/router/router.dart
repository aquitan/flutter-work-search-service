import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/new_password_screen.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/features/blog/view/blog_screen.dart';
import 'package:ia_ma/features/home/view/home_screen.dart';
import 'package:ia_ma/features/publication/publication.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';

import '../features/chat/chat.dart';
import '../features/orders/orders.dart';
import '../features/profile/view/view.dart';
import '../features/works/works.dart';

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
        AutoRoute(page: NewPasswordRoute.page),
        AutoRoute(page: RegisterPasswordRoute.page),
        AutoRoute(
            page: HomeRoute.page,
            initial: true,
            path: '/',
            children: [
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: WorksRoute.page, path: 'works'),
          AutoRoute(page: OrdersRoute.page, path: 'orders'),
          AutoRoute(page: ChatRoute.page, path: 'chat'),
          AutoRoute(page: BlogRoute.page, path: 'blog'),
        ], guards: [
          AuthGuard()
        ]),
        // AutoRoute(
        //     page: ProfileRoute.page, path: '/profile', guards: [AuthGuard()]),
        // AutoRoute(
        //     page: PublicationRoute.page,
        //     path: '/publication',
        //     guards: [AuthGuard()]),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (AuthProvider()._isLoggedIn) {
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
