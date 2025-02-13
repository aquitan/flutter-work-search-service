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
/// [BlogScreen]
class BlogRoute extends PageRouteInfo<void> {
  const BlogRoute({List<PageRouteInfo>? children})
      : super(
          BlogRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BlogScreen();
    },
  );
}

/// generated route for
/// [BlogUserScreen]
class BlogUserRoute extends PageRouteInfo<BlogUserRouteArgs> {
  BlogUserRoute({
    Key? key,
    required int userId,
    List<PageRouteInfo>? children,
  }) : super(
          BlogUserRoute.name,
          args: BlogUserRouteArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogUserRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<BlogUserRouteArgs>();
      return BlogUserScreen(
        key: args.key,
        userId: args.userId,
      );
    },
  );
}

class BlogUserRouteArgs {
  const BlogUserRouteArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int userId;

  @override
  String toString() {
    return 'BlogUserRouteArgs{key: $key, userId: $userId}';
  }
}

/// generated route for
/// [ChatScreen]
class ChatRoute extends PageRouteInfo<void> {
  const ChatRoute({List<PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChatScreen();
    },
  );
}

/// generated route for
/// [FastLoginScreen]
class FastLoginRoute extends PageRouteInfo<FastLoginRouteArgs> {
  FastLoginRoute({
    Key? key,
    required String value,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          FastLoginRoute.name,
          args: FastLoginRouteArgs(
            key: key,
            value: value,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'FastLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FastLoginRouteArgs>();
      return FastLoginScreen(
        key: args.key,
        value: args.value,
        type: args.type,
      );
    },
  );
}

class FastLoginRouteArgs {
  const FastLoginRouteArgs({
    this.key,
    required this.value,
    required this.type,
  });

  final Key? key;

  final String value;

  final String type;

  @override
  String toString() {
    return 'FastLoginRouteArgs{key: $key, value: $value, type: $type}';
  }
}

/// generated route for
/// [FiltersScreen]
class FiltersRoute extends PageRouteInfo<void> {
  const FiltersRoute({List<PageRouteInfo>? children})
      : super(
          FiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FiltersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FiltersScreen();
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
/// [NewPasswordScreen]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required String value,
    required String type,
    List<PageRouteInfo>? children,
  }) : super(
          NewPasswordRoute.name,
          args: NewPasswordRouteArgs(
            key: key,
            value: value,
            type: type,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPasswordRouteArgs>();
      return NewPasswordScreen(
        key: args.key,
        value: args.value,
        type: args.type,
      );
    },
  );
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.value,
    required this.type,
  });

  final Key? key;

  final String value;

  final String type;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, value: $value, type: $type}';
  }
}

/// generated route for
/// [OrderCreationScreen]
class OrderCreationRoute extends PageRouteInfo<void> {
  const OrderCreationRoute({List<PageRouteInfo>? children})
      : super(
          OrderCreationRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderCreationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderCreationScreen();
    },
  );
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersScreen();
    },
  );
}

/// generated route for
/// [ProfileAboutScreen]
class ProfileAboutRoute extends PageRouteInfo<void> {
  const ProfileAboutRoute({List<PageRouteInfo>? children})
      : super(
          ProfileAboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileAboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileAboutScreen();
    },
  );
}

/// generated route for
/// [ProfileMasterScreen]
class ProfileMasterRoute extends PageRouteInfo<void> {
  const ProfileMasterRoute({List<PageRouteInfo>? children})
      : super(
          ProfileMasterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileMasterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileMasterScreen();
    },
  );
}

/// generated route for
/// [ProfileNotificationsScreen]
class ProfileNotificationsRoute extends PageRouteInfo<void> {
  const ProfileNotificationsRoute({List<PageRouteInfo>? children})
      : super(
          ProfileNotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileNotificationsScreen();
    },
  );
}

/// generated route for
/// [ProfilePersonalDataScreen]
class ProfilePersonalDataRoute extends PageRouteInfo<void> {
  const ProfilePersonalDataRoute({List<PageRouteInfo>? children})
      : super(
          ProfilePersonalDataRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePersonalDataRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePersonalDataScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return ProfileScreen(
        key: args.key,
        id: args.id,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ProfileSettingsScreen]
class ProfileSettingsRoute extends PageRouteInfo<void> {
  const ProfileSettingsRoute({List<PageRouteInfo>? children})
      : super(
          ProfileSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileSettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileSettingsScreen();
    },
  );
}

/// generated route for
/// [ProfileThemeScreen]
class ProfileThemeRoute extends PageRouteInfo<void> {
  const ProfileThemeRoute({List<PageRouteInfo>? children})
      : super(
          ProfileThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileThemeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileThemeScreen();
    },
  );
}

/// generated route for
/// [ProfileVerificationScreen]
class ProfileVerificationRoute extends PageRouteInfo<void> {
  const ProfileVerificationRoute({List<PageRouteInfo>? children})
      : super(
          ProfileVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileVerificationScreen();
    },
  );
}

/// generated route for
/// [PublicationScreen]
class PublicationRoute extends PageRouteInfo<PublicationRouteArgs> {
  PublicationRoute({
    Key? key,
    required int id,
    required int publicationUserId,
    List<PageRouteInfo>? children,
  }) : super(
          PublicationRoute.name,
          args: PublicationRouteArgs(
            key: key,
            id: id,
            publicationUserId: publicationUserId,
          ),
          initialChildren: children,
        );

  static const String name = 'PublicationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PublicationRouteArgs>();
      return PublicationScreen(
        key: args.key,
        id: args.id,
        publicationUserId: args.publicationUserId,
      );
    },
  );
}

class PublicationRouteArgs {
  const PublicationRouteArgs({
    this.key,
    required this.id,
    required this.publicationUserId,
  });

  final Key? key;

  final int id;

  final int publicationUserId;

  @override
  String toString() {
    return 'PublicationRouteArgs{key: $key, id: $id, publicationUserId: $publicationUserId}';
  }
}

/// generated route for
/// [RegisterPasswordScreen]
class RegisterPasswordRoute extends PageRouteInfo<RegisterPasswordRouteArgs> {
  RegisterPasswordRoute({
    Key? key,
    required String value,
    required String type,
    bool? isCompany,
    String? firstName,
    String? lastName,
    String? middleName,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterPasswordRoute.name,
          args: RegisterPasswordRouteArgs(
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

  static const String name = 'RegisterPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterPasswordRouteArgs>();
      return RegisterPasswordScreen(
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

class RegisterPasswordRouteArgs {
  const RegisterPasswordRouteArgs({
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
    return 'RegisterPasswordRouteArgs{key: $key, value: $value, type: $type, isCompany: $isCompany, firstName: $firstName, lastName: $lastName, middleName: $middleName}';
  }
}

/// generated route for
/// [RestorePasswordScreen]
class RestorePasswordRoute extends PageRouteInfo<RestorePasswordRouteArgs> {
  RestorePasswordRoute({
    Key? key,
    required String type,
    required String value,
    List<PageRouteInfo>? children,
  }) : super(
          RestorePasswordRoute.name,
          args: RestorePasswordRouteArgs(
            key: key,
            type: type,
            value: value,
          ),
          initialChildren: children,
        );

  static const String name = 'RestorePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RestorePasswordRouteArgs>();
      return RestorePasswordScreen(
        key: args.key,
        type: args.type,
        value: args.value,
      );
    },
  );
}

class RestorePasswordRouteArgs {
  const RestorePasswordRouteArgs({
    this.key,
    required this.type,
    required this.value,
  });

  final Key? key;

  final String type;

  final String value;

  @override
  String toString() {
    return 'RestorePasswordRouteArgs{key: $key, type: $type, value: $value}';
  }
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

/// generated route for
/// [WorksScreen]
class WorksRoute extends PageRouteInfo<void> {
  const WorksRoute({List<PageRouteInfo>? children})
      : super(
          WorksRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorksRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorksScreen();
    },
  );
}
