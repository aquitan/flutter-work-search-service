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

@JsonSerializable()
class PublicationResponse {
  PublicationResponse({required this.data});

  final PublicationResponseModel data;

  factory PublicationResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationResponseToJson(this);
}

@JsonSerializable()
class PublicationResponseModel {
  PublicationResponseModel(
      this.userId,
      this.text,
      this.price,
      this.id,
      this.state,
      this.isBookmarked,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      {required this.publicationId});

  @JsonKey(name: 'publication_id')
  final int publicationId;

  @JsonKey(name: 'user_id')
  final int userId;

  final String? text;

  final int? price;

  final int? id;

  final String? state;

  final bool isBookmarked;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  factory PublicationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationResponseModelToJson(this);
}

@JsonSerializable()
class PublicationCheckMyResponse extends PublicationResponseModel {
  final PublicationResponseChatsList? chat;

  PublicationCheckMyResponse(
      super.userId,
      super.text,
      super.price,
      super.id,
      super.state,
      super.isBookmarked,
      super.createdAt,
      super.updatedAt,
      super.deletedAt,
      {required this.chat,
      required super.publicationId});

  factory PublicationCheckMyResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicationCheckMyResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PublicationCheckMyResponseToJson(this);
}

@JsonSerializable()
class PublicationResponseChatsList {
  final int id;

  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'executor_user_id')
  final String executorUserId;

  @JsonKey(name: 'publication_id')
  final String publicationId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'publication_response_id')
  final String publicationResponseId;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  PublicationResponseChatsList(
      {required this.id,
      required this.userId,
      required this.executorUserId,
      required this.publicationId,
      required this.createdAt,
      required this.publicationResponseId,
      required this.updatedAt,
      required this.deletedAt});

  factory PublicationResponseChatsList.fromJson(Map<String, dynamic> json) =>
      _$PublicationResponseChatsListFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationResponseChatsListToJson(this);
}
