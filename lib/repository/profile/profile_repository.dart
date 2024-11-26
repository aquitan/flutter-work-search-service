import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/auth/models/auth_models.dart';
import 'package:ia_ma/repository/profile/abstract_profile_repository.dart';
import 'package:ia_ma/repository/profile/models/profile_model.dart';

class ProfileRepository implements AbstractProfileRepository {
  final Dio dio;

  ProfileRepository({required this.dio});

  @override
  Future<Profile> getUserById(int id) async {
    Response response = await dio.get('${dotenv.env['API_USER']}/user/$id');

    return Profile.fromJson(response.data);
  }


  @override
  Future<User> getMe() async {
    Response response = await dio.get('${dotenv.env['API_USER']}/user/me');

    return User.fromJson(response.data);
  }
}
