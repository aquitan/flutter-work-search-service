import 'package:dio/dio.dart';
import 'package:ia_ma/repository/publication/abstract_publication_repository.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';

class PublicationRepository implements AbstractPublicationRepository {
  PublicationRepository({required this.dio});

  final Dio dio;

  @override
  Future<PublicationModel> getPublicationById(int id) async {
    final response = await dio.get('api_publication/publications/$id');

    return PublicationModel.fromJson(response.data);
  }
}
