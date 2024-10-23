import 'package:auto_route/auto_route.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/features/home/view/home_screen.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, path: '/auth', children: [
          AutoRoute(page: AuthOtpCheckRoute.page, path: 'otp-check'),
          AutoRoute(page: AuthPasswordRoute.page, path: 'password'),
          AutoRoute(page: AuthRegisterRoute.page, path: 'register'),
          AutoRoute(page: FastLoginRoute.page, path: 'fast-login'),
          AutoRoute(page: RestorePasswordRoute.page, path: 'restore-password'),
        ]),
        AutoRoute(page: HomeRoute.page, path: '/', guards: [AuthGuard()])
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}

class AuthGuard extends AutoRouteGuard {
  final bool authenticated = false;
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
