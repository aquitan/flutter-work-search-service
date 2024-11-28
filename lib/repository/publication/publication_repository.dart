import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/publication/abstract_publication_repository.dart';
import 'package:ia_ma/repository/publication/models/publication_models.dart';

class PublicationRepository implements AbstractPublicationRepository {
  PublicationRepository({required this.dio});

  final Dio dio;

  @override
  Future<PublicationModel> getPublicationById(int id) async {
    final response =
        await dio.get('${dotenv.env['API_PUBLICATIONS']}/publications/$id');

    return PublicationModel.fromJson(response.data);
  }
}
