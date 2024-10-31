import 'package:ia_ma/repository/auth/models/auth_models.dart';

abstract class AbstractAuthRepository {
  Future<User> chekUserLogin(String type, String value);
  Future<ConfirmCodeResponse> getConfirmCode(String type, String value);
  Future<SendConfirmCodeResponse> sendConfirmCode(
      String type, String value, int code);
  Future<RegisterUserResponse> signUp(String? type, Map<String, dynamic> data);
  Future<SignInUserResponse> signIn(String? type, Map<String, dynamic> data);
}
