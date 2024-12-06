import 'package:ia_ma/repository/publication/models/publication_models.dart';

abstract class AbstractPublicationRepository {
  Future<PublicationModel> getPublicationById(int id);
  Future<PublicationResponse> createPublicationResponse(int id);
  Future<PublicationCheckMyResponse> getCheckMyResponse(int id);
  Future<RepliesModel> getReplies(int id);
}
