import 'package:ia_ma/repository/user/models/user_model.dart';

abstract class AbstractUserRepository {
  Future<MyUser> getMe();
  Future<UserCategories> getUserCategories();
}
