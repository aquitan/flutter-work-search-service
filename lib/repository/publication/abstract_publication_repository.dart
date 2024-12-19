import 'package:ia_ma/repository/publication/models/publication_models.dart';

abstract class AbstractPublicationRepository {
  Future<PublicationModel> getPublicationById(int id);
  Future<PublicationResponse> createPublicationResponse(
      int id, Map<String, dynamic>? data);
  Future<PublicationCheckMyResponse> getCheckMyResponse(int id);
  Future<CandidatesModel> getReplies(int id);
}
