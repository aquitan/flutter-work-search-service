import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/api/api.dart';
import 'package:ia_ma/iama_app.dart';
import 'package:ia_ma/repository/token/token_repository.dart';
import 'package:ia_ma/repository/token/token_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repository/auth/abstract_auth_repository.dart';
import 'repository/auth/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  final SharedPreferences prefferences = await SharedPreferences.getInstance();



  final dio = ApiClient.dio();
  final talker = TalkerFlutter.init();
  // final authProvider = AuthProvider();
  final tokenRep = TokenRepository(prefferences: prefferences);

  GetIt.I.registerSingleton<TokenRepositoryInterface>(tokenRep);

  // GetIt.I.registerSingleton<AuthProvider>(authProvider);

  GetIt.I.registerLazySingleton<AbstractAuthRepository>(
      () => AuthRepository(dio: dio));

  dio.interceptors.add(
      TalkerDioLogger(talker: talker, settings: TalkerDioLoggerSettings()));

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

