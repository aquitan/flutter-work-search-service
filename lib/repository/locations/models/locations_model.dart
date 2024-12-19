import 'package:json_annotation/json_annotation.dart';

part 'locations_model.g.dart';

@JsonSerializable()
class LocationsModel {
  final int? count;
  final List<Location> data;

  LocationsModel({required this.count, required this.data});

  factory LocationsModel.fromJson(Map<String, dynamic> json) =>
      _$LocationsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationsModelToJson(this);
}

@JsonSerializable()
class Location {
  final int? id;
  final double? lgt;
  final double? ltt;
  final String? name;

  @JsonKey(name: 'region_id')
  final int? regionId;

  Location(
      {required this.id,
      required this.lgt,
      required this.ltt,
      required this.name,
      required this.regionId});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
