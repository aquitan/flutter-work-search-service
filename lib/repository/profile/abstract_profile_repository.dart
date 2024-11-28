import 'package:ia_ma/repository/profile/models/profile_model.dart';

abstract class AbstractProfileRepository {
  Future<Profile> getUserById(int id);

}
