class AppLatLong {
  AppLatLong({required this.lat, required this.long});

  final double lat;
  final double long;
}

abstract class AppLocation {
  Future<AppLatLong> setCurrentLocation();
}
