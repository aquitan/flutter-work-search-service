// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AuthOtpCheckScreen]
class AuthOtpCheckRoute extends PageRouteInfo<AuthOtpCheckRouteArgs> {
  AuthOtpCheckRoute({
    Key? key,
    required String type,
    required String value,
    List<PageRouteInfo>? children,
  }) : super(
          AuthOtpCheckRoute.name,
          args: AuthOtpCheckRouteArgs(
            key: key,
            type: type,
            value: value,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthOtpCheckRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthOtpCheckRouteArgs>();
      return AuthOtpCheckScreen(
        key: args.key,
        type: args.type,
        value: args.value,
      );
    },
  );
}

class AuthOtpCheckRouteArgs {
  const AuthOtpCheckRouteArgs({
    this.key,
    required this.type,
    required this.value,
  });

  final Key? key;

  final String type;

  final String value;

  @override
  String toString() {
    return 'AuthOtpCheckRouteArgs{key: $key, type: $type, value: $value}';
  }
}

/// generated route for
/// [AuthPasswordScreen]
class AuthPasswordRoute extends PageRouteInfo<AuthPasswordRouteArgs> {
  AuthPasswordRoute({
    Key? key,
    required String value,
    required String type,
    bool? isCompany,
    String? firstName,
    String? lastName,
    String? middleName,
    List<PageRouteInfo>? children,
  }) : super(
          AuthPasswordRoute.name,
          args: AuthPasswordRouteArgs(
            key: key,
            value: value,
            type: type,
            isCompany: isCompany,
            firstName: firstName,
            lastName: lastName,
            middleName: middleName,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthPasswordRouteArgs>();
      return AuthPasswordScreen(
        key: args.key,
        value: args.value,
        type: args.type,
        isCompany: args.isCompany,
        firstName: args.firstName,
        lastName: args.lastName,
        middleName: args.middleName,
      );
    },
  );
}

class AuthPasswordRouteArgs {
  const AuthPasswordRouteArgs({
    this.key,
    required this.value,
    required this.type,
    this.isCompany,
    this.firstName,
    this.lastName,
    this.middleName,
  });

  final Key? key;

  final String value;

  final String type;

  final bool? isCompany;

  final String? firstName;

  final String? lastName;

  final String? middleName;

  @override
  String toString() {
    return 'AuthPasswordRouteArgs{key: $key, value: $value, type: $type, isCompany: $isCompany, firstName: $firstName, lastName: $lastName, middleName: $middleName}';
  }
}

/// generated route for
/// [AuthRegisterScreen]
class AuthRegisterRoute extends PageRouteInfo<AuthRegisterRouteArgs> {
  AuthRegisterRoute({
    Key? key,
    required String value,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRegisterRoute.name,
          args: AuthRegisterRouteArgs(
            key: key,
            value: value,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthRegisterRouteArgs>();
      return AuthRegisterScreen(
        key: args.key,
        value: args.value,
        type: args.type,
      );
    },
  );
}

class AuthRegisterRouteArgs {
  const AuthRegisterRouteArgs({
    this.key,
    required this.value,
    required this.type,
  });

  final Key? key;

  final String value;

  final String type;

  @override
  String toString() {
    return 'AuthRegisterRouteArgs{key: $key, value: $value, type: $type}';
  }
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthScreen();
    },
  );
}

/// generated route for
/// [FastLoginScreen]
class FastLoginRoute extends PageRouteInfo<void> {
  const FastLoginRoute({List<PageRouteInfo>? children})
      : super(
          FastLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'FastLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FastLoginScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [RestorePasswordScreen]
class RestorePasswordRoute extends PageRouteInfo<void> {
  const RestorePasswordRoute({List<PageRouteInfo>? children})
      : super(
          RestorePasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestorePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RestorePasswordScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}
