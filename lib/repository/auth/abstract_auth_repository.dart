import 'package:ia_ma/repository/auth/models/auth_models.dart';

abstract class AbstractAuthRepository {
  Future<User> chekUserLogin(String type, String value);
  Future<ConfirmCodeResponse> getConfirmCode(String type, String value);
  Future<ConfirmCodeResponse> sendConfirmCode(
      String type, String value, int code);
}
