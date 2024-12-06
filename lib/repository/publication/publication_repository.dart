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

  @override
  Future<PublicationResponse> createPublicationResponse(int id) async {
    final response = await dio.post(
        '${dotenv.env['API_PUBLICATIONS']}/publications/$id/responses',
        data: {});

    return PublicationResponse.fromJson(response.data);
  }

  @override
  Future<PublicationCheckMyResponse> getCheckMyResponse(int id) async {
    final response = await dio
        .get('${dotenv.env['API_PUBLICATIONS']}/publications/$id/responses/my');

    return PublicationCheckMyResponse.fromJson(response.data);
  }

  @override
  Future<RepliesModel> getReplies(int id) async {
    final response = await dio.get(
        '${dotenv.env['API_PUBLICATIONS']}/publications/$id/responses?take=12');

    return RepliesModel.fromJson(response.data);
  }

}
