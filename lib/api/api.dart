import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {

  static Dio dio() {

    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      baseUrl: '${dotenv.env['HOST']}',
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      },
      responseType: ResponseType.json,
    );
    final dio = Dio(options);
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return dio;
  }
}
