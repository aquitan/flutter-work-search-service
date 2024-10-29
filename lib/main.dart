import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/iama_app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repository/auth/abstract_auth_repository.dart';
import 'repository/auth/auth_repository.dart';

void main() async {
  // await dotenv.load(fileName: '.env');
  // print(dotenv.env['HOST']);

  final dio = Dio();
  final talker = TalkerFlutter.init();


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

  runZonedGuarded(() => runApp(const IamaApp()), (error, stack) {
    GetIt.I<Talker>().handle(error, stack);
  }); // Ловим ошибки запросов к серверу


}

