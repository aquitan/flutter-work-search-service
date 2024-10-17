import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
