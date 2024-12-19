import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ia_ma/repository/locations/models/locations_model.dart';
import 'package:ia_ma/repository/repository.dart';

class LocationsRepository implements AbstractLocationsRepository {
  final Dio dio;

  LocationsRepository({required this.dio});

  @override
  Future<LocationsModel> getLocations() async {
    final response =
        await dio.get('${dotenv.env['API_SEARCH']}/list/locations/all');

    return LocationsModel.fromJson(response.data);
  }
}
