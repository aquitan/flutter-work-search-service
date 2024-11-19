import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {

  static Dio dio(pref, appDocDir) {



    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      baseUrl: '${dotenv.env['HOST']}',
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': 'Bearer ${pref.getString('token')}',
      },
      responseType: ResponseType.json,
    );
    final dio = Dio(options);
    final String appDocPath = appDocDir.path;
    // final cookieJar = CookieJar();
    final cookieJar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );

    dio.interceptors.add(CookieManager(cookieJar));

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    return dio;
  }
}
