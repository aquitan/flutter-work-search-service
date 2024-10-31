import 'package:dio/dio.dart';
import 'package:ia_ma/repository/auth/models/auth_models.dart';

import 'abstract_auth_repository.dart';

class AuthRepository implements AbstractAuthRepository {
  AuthRepository({required this.dio});

  final Dio dio;


  @override
  Future<User> chekUserLogin(String type, String value) async {
    Response response = await dio
        .get('api_auth/auth/$type/check?$type=$value');
    return User.fromJson(response.data);
  }

  @override
  Future<ConfirmCodeResponse> getConfirmCode(String type, String value) async {
    Response response = await dio
        .get('api_auth/auth/$type/confirm?$type=$value');
    return ConfirmCodeResponse.fromJson(response.data);
  }

  @override
  Future<SendConfirmCodeResponse> sendConfirmCode(
    String type,
    String value,
    int code,
  ) async {
    Response response = await dio.post(
        'api_auth/auth/$type/confirm',
        data: {'code': code, type: value});
    return SendConfirmCodeResponse.fromJson(response.data);
  }

  @override
  Future<RegisterUserResponse> signUp(type, data) async {
    Response response =
        await dio.post('api_auth/auth/$type/sign-up', data: data);
    return RegisterUserResponse.fromJson(response.data);
  }

  @override
  Future<SignInUserResponse> signIn(type, data) async {
    Response response =
        await dio.post('api_auth/auth/$type/sign-in', data: data);
    return SignInUserResponse.fromJson(response.data);
  }
}
