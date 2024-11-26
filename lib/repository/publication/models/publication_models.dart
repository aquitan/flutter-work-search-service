import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publication_models.g.dart';

@JsonSerializable()
class PublicationModel {
  final Order data;

  PublicationModel({required this.data});

  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationModelToJson(this);
}
