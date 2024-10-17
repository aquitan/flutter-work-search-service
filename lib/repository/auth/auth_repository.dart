import 'package:dio/dio.dart';
import 'package:ia_ma/repository/auth/models/auth_models.dart';

import 'abstract_auth_repository.dart';

class AuthRepository implements AbstractAuthRepository {
  @override
  Future<User> chekUserLogin() async {
    try {
      Response response = await Dio().get(
          'https://stage.ia-ma.ru/api_auth/auth/check/email/?email=sukharevsky@ia-ma.ru');
      return User.fromJson(response.data);
    } on DioException catch (e) {
      print('${e.message}');
      rethrow;
    }
  }
}
