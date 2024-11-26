import 'package:ia_ma/repository/publication/models/publication_models.dart';

abstract class AbstractPublicationRepository {
  Future<PublicationModel> getPublicationById(int id);
}
