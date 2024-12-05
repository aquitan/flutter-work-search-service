import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/auth/models/auth_models.dart';

import 'abstract_auth_repository.dart';

class AuthRepository implements AbstractAuthRepository {
  AuthRepository({required this.dio});

  final Dio dio;


  @override
  Future<User> chekUserLogin(String type, String value) async {
    Response response = await dio
        .get('${dotenv.env['API_AUTH']}/auth/$type/check?$type=$value');
    return User.fromJson(response.data);
  }

  @override
  Future<ConfirmCodeResponse> getConfirmCode(String type, String value) async {
    Response response = await dio
        .get('${dotenv.env['API_AUTH']}/auth/$type/confirm?$type=$value');
    return ConfirmCodeResponse.fromJson(response.data);
  }

  @override
  Future<SendConfirmCodeResponse> sendConfirmCode(
    String type,
    String value,
    int code,
  ) async {
    Response response = await dio.post(
        '${dotenv.env['API_AUTH']}/auth/$type/confirm',
        data: {'code': code, type: value});
    return SendConfirmCodeResponse.fromJson(response.data);
  }

  @override
  Future<RegisterUserResponse> signUp(type, data) async {
    Response response =
        await dio
        .post('${dotenv.env['API_AUTH']}/auth/$type/sign-up', data: data);
    return RegisterUserResponse.fromJson(response.data);
  }

  @override
  Future<SignInUserResponse> signIn(type, data) async {
    Response response =
        await dio
        .post('${dotenv.env['API_AUTH']}/auth/$type/sign-in', data: data);
    return SignInUserResponse.fromJson(response.data);
  }

  @override
  Future<ResetPasswordResponse> resetPassword(type, data) async {
    Response response =
        await dio.post(
        '${dotenv.env['API_AUTH']}/auth/$type/reset_password/',
        data: data);
    return ResetPasswordResponse.fromJson(response.data);
  }

  @override
  Future<SignInUserResponse> fastAuth(type) async {
    Response response =
        await dio.get('${dotenv.env['API_AUTH']}/auth/$type/authorize');
    return SignInUserResponse.fromJson(response.data);
  }

  // @override
  // Future<void> logout(type) async {
  //   Response response = await dio.get('api_auth/auth/$type/sign-out');

  // }
}
