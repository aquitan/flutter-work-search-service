import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/bloc/bloc/categories_bloc.dart';
import 'package:ia_ma/bloc/cubit/theme_cubit.dart';
import 'package:ia_ma/bloc/locationsBloc/bloc/locations_bloc.dart';
import 'package:ia_ma/bloc/myUserBloc/bloc/my_user_bloc.dart';
import 'package:ia_ma/bloc/publicationReplies/bloc/replies_bloc.dart';
import 'package:ia_ma/bloc/userCategories/bloc/user_categories_bloc.dart';
import 'package:ia_ma/features/auth/bloc/auth_bloc.dart';
import 'package:ia_ma/features/orders/bloc/orders_bloc.dart';
import 'package:ia_ma/features/profile/bloc/profile_bloc.dart';
import 'package:ia_ma/features/publication/bloc/publication_bloc.dart';
import 'package:ia_ma/features/search/bloc/search_bloc.dart';
import 'package:ia_ma/features/works/bloc/works_bloc.dart';
import 'package:ia_ma/repository/repository.dart';
import 'package:ia_ma/repository/user/abstract_user_repository.dart';
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
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(GetIt.I<AbstractAuthRepository>(),
                GetIt.I<TokenRepositoryInterface>()),
          ),
          BlocProvider(
            create: (context) =>
                ProfileBloc(GetIt.I<AbstractProfileRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                CategoriesBloc(GetIt.I<AbstractCategoriesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                OrdersBloc(GetIt.I<AbstractOrdersRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchBloc(GetIt.I<AbstractOrdersRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                PublicationBloc(GetIt.I<AbstractPublicationRepository>()),
          ),
          BlocProvider(
            create: (context) => MyUserBloc(GetIt.I<AbstractUserRepository>()),
          ),
          BlocProvider(
            create: (context) => WorksBloc(GetIt.I<AbstractWorksRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                RepliesBloc(GetIt.I<AbstractPublicationRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                UserCategoriesBloc(GetIt.I<AbstractUserRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                LocationsBloc(GetIt.I<AbstractLocationsRepository>()),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'YaMa',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('ru'),
              ],
              theme: !state.isDark ? lightThemeData : darkThemeData,
              routerConfig: appRouter.config(
                navigatorObservers: () =>
                    [TalkerRouteObserver(GetIt.I<Talker>())],
              ),
            );
          },
        ));
  }
}
