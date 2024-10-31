import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ia_ma/api/api.dart';
import 'package:ia_ma/iama_app.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'repository/auth/abstract_auth_repository.dart';
import 'repository/auth/auth_repository.dart';

void main() async {
  // await dotenv.load(fileName: '.env');
  // print(dotenv.env['HOST']);

  // BaseOptions options = BaseOptions(
  //   baseUrl: 'https://stage.ia-ma.ru/',
  //   connectTimeout: const Duration(seconds: 5),
  //   receiveTimeout: const Duration(seconds: 5),
  //   headers: {
  //     'Accept': 'application/json',
  //     'Content-type': 'application/json',
  //     'X-Requested-With': 'XMLHttpRequest',
  //   },
  //   contentType: 'application/json; charset=utf-8',
  //   responseType: ResponseType.json,
  // );

  final dio = ApiClient.dio();
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

