import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/user/abstract_user_repository.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';

class UserRepository implements AbstractUserRepository {
  final Dio dio;

  UserRepository({required this.dio});

  @override
  Future<MyUser> getMe() async {
    Response response = await dio.get('${dotenv.env['API_USER']}/user/me');

    return MyUser.fromJson(response.data);
  }
}
