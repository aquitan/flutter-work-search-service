import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ia_ma/features/auth/view/new_password_screen.dart';
import 'package:ia_ma/features/auth/view/view.dart';
import 'package:ia_ma/features/blog/view/view.dart';
import 'package:ia_ma/features/filters/filters.dart';
import 'package:ia_ma/features/home/view/home_screen.dart';
import 'package:ia_ma/features/publication/publication.dart';
import 'package:ia_ma/features/search/view/search_screen.dart';
import 'package:ia_ma/router/guards.dart';

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
        AutoRoute(page: HomeRoute.page, initial: true, path: '/', children: [
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: WorksRoute.page, path: 'works'),
          AutoRoute(page: OrdersRoute.page, path: 'orders'),
          AutoRoute(page: ChatRoute.page, path: 'chat'),
          AutoRoute(page: EmptyShellRoute('blog'), path: 'blog', children: [
            AutoRoute(page: BlogRoute.page, path: ''),
            AutoRoute(page: BlogUserRoute.page, path: ':userId'),
          ]),
        ], guards: [
          AuthGuard()
        ]),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
        AutoRoute(page: ProfileThemeRoute.page, path: '/profile_theme'),
        AutoRoute(
            page: ProfilePersonalDataRoute.page, path: '/profile_personal'),
        AutoRoute(
            page: ProfileVerificationRoute.page, path: '/profile_verification'),
        AutoRoute(
            page: ProfileNotificationsRoute.page,
            path: '/profile_notification'),
        AutoRoute(page: ProfileSettingsRoute.page, path: '/profile_settings'),
        AutoRoute(page: ProfileMasterRoute.page, path: '/profile_master'),
        AutoRoute(page: ProfileAboutRoute.page, path: '/profile_about'),
        AutoRoute(page: FiltersRoute.page, path: '/filters'),
        AutoRoute(page: OrderCreationRoute.page, path: '/creation'),

        AutoRoute(
          page: PublicationRoute.page,
          path: '/publication',
        ),
      ];
}


// class AuthProvider extends ChangeNotifier {

//   bool _isLoggedIn = false;

//   bool get isLoggedIn => _isLoggedIn;


//   void login() {
//     _isLoggedIn = true;
//     notifyListeners();
//   }

//   void logout() {
//     _isLoggedIn = false;
//     notifyListeners();
//   }
// }
