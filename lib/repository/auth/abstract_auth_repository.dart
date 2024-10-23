import 'package:ia_ma/repository/auth/models/auth_models.dart';

abstract class AbstractAuthRepository {
  Future<User> chekUserLogin();
}
