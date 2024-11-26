import 'package:ia_ma/repository/auth/models/auth_models.dart';
import 'package:ia_ma/repository/profile/models/profile_model.dart';

abstract class AbstractProfileRepository {
  Future<Profile> getUserById(int id);

  Future<User> getMe();
}
