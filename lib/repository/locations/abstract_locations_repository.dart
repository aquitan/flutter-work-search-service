import 'package:ia_ma/repository/locations/models/locations_model.dart';

abstract class AbstractLocationsRepository {
  Future<LocationsModel> getLocations();
}
