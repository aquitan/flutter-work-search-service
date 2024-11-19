import 'package:dio/dio.dart';
import 'package:ia_ma/repository/profile/abstract_profile_repository.dart';
import 'package:ia_ma/repository/profile/models/profile_model.dart';

class ProfileRepository implements AbstractProfileRepository {
  final Dio dio;

  ProfileRepository({required this.dio});

  @override
  Future<Profile> getUserById(int id) async {
    Response response = await dio.get('api_user/user/$id');

    return Profile.fromJson(response.data);
  }
}
