import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/api/api.dart';
import 'package:ia_ma/iama_app.dart';
import 'package:ia_ma/repository/repository.dart';
import 'package:ia_ma/repository/user/abstract_user_repository.dart';
import 'package:ia_ma/repository/user/user_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final SharedPreferences prefferences = await SharedPreferences.getInstance();

  final Directory appDocDir = await getApplicationDocumentsDirectory();


  final dio = ApiClient.dio(appDocDir, prefferences);
  final talker = TalkerFlutter.init();
  // final authProvider = AuthProvider();
  final tokenRep = TokenRepository(prefferences: prefferences);



  GetIt.I.registerSingleton<TokenRepositoryInterface>(tokenRep);

  // GetIt.I.registerSingleton<AuthProvider>(authProvider);

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
      () => AuthRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractProfileRepository>(
      () => ProfileRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractCategoriesRepository>(
      () => CategoriesRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractOrdersRepository>(
      () => OrdersRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractUserRepository>(
      () => UserRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractWorksRepository>(
      () => WorksRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractPublicationRepository>(
      () => PublicationRepository(dio: dio));

  GetIt.I.registerLazySingleton<AbstractLocationsRepository>(
      () => LocationsRepository(dio: dio));

  dio.interceptors.add(
      TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
      )));

  Bloc.observer = TalkerBlocObserver(talker: talker);


  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I<Talker>().debug('Talker started...');

  FlutterError.onError = (FlutterErrorDetails details) =>
      GetIt.I<Talker>().handle(details.exception, details.stack);
  // Ловим ошибки верстки флаттеар, на случай если подключить облачный хэндлер ошибок (CrashLytics || Sentry)
  // - облачные мониторинги ошибок

  // runZonedGuarded(() => runApp(const IamaApp()), (error, stack) {
  //   GetIt.I<Talker>().handle(error, stack);
  // }); // Ловим ошибки запросов к серверу


  return runApp(const IamaApp());
}

