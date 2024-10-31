import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class ApiClient {
  static Dio dio() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      baseUrl: 'https://stage.ia-ma.ru/',
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
    return dio;
  }
}
