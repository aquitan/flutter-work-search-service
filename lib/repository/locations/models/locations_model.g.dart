// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsModel _$LocationsModelFromJson(Map<String, dynamic> json) =>
    LocationsModel(
      count: (json['count'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationsModelToJson(LocationsModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: (json['id'] as num?)?.toInt(),
      lgt: (json['lgt'] as num?)?.toDouble(),
      ltt: (json['ltt'] as num?)?.toDouble(),
      name: json['name'] as String?,
      regionId: (json['region_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'lgt': instance.lgt,
      'ltt': instance.ltt,
      'name': instance.name,
      'region_id': instance.regionId,
    };
