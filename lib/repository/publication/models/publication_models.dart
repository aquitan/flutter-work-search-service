import 'package:ia_ma/repository/auth/models/auth_models.dart';
import 'package:ia_ma/repository/orders/models/orders_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publication_models.g.dart';


/////////////////////// PublicationModel
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


////////////////////// PublicationResponseModel
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
  final int? userId;

  final String? text;

  final int? price;

  final int? id;

  final String? state;

  final bool? isBookmarked;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  factory PublicationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationResponseModelToJson(this);
}


// PublicationCheckMyResponse
@JsonSerializable()
class PublicationCheckMyResponse {
  final PublicationResponseChat? chat;

  @JsonKey(name: 'publication_id')
  final int? publicationId;

  @JsonKey(name: 'user_id')
  final int? userId;

  final String? text;

  final int? price;

  final int? id;

  final String? state;

  final bool? isBookmarked;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  PublicationCheckMyResponse(
      {required this.chat,
      required this.publicationId,
      required this.userId,
      required this.text,
      required this.price,
      required this.id,
      required this.state,
      required this.isBookmarked,
      required this.createdAt,
      required this.updatedAt,
      required this.deletedAt});


  factory PublicationCheckMyResponse.fromJson(Map<String, dynamic> json) =>
      _$PublicationCheckMyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationCheckMyResponseToJson(this);
}


// PublicationResponseChat
@JsonSerializable()
class PublicationResponseChat {
  final int? id;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'executor_user_id')
  final int? executorUserId;

  @JsonKey(name: 'publication_id')
  final int? publicationId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'publication_response_id')
  final int? publicationResponseId;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  PublicationResponseChat(
      {required this.id,
      required this.userId,
      required this.executorUserId,
      required this.publicationId,
      required this.createdAt,
      required this.publicationResponseId,
      required this.updatedAt,
      required this.deletedAt});

  factory PublicationResponseChat.fromJson(Map<String, dynamic> json) =>
      _$PublicationResponseChatFromJson(json);

  Map<String, dynamic> toJson() => _$PublicationResponseChatToJson(this);
}

// CandidatesModel List
@JsonSerializable()
class CandidatesModel {
  CandidatesModel({required this.count, required this.data});

  final int count;
  final List<CandidateModel>? data;

  factory CandidatesModel.fromJson(Map<String, dynamic> json) =>
      _$CandidatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidatesModelToJson(this);
}

// CandidateModel
@JsonSerializable()
class CandidateModel {
  CandidateModel(
      {required this.chat,
      required this.createdAt,
      required this.deletedAt,
      required this.id,
      required this.price,
      required this.isBookmarked,
      required this.publicationId,
      required this.state,
      required this.text,
      required this.user,
      required this.userId,
      required this.updatedAt});

  final PublicationResponseChat? chat;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  final int? id;

  final int? price;

  final bool? isBookmarked;

  @JsonKey(name: 'publication_id')
  final int? publicationId;

  final String? state;

  final String? text;

  final User user;

  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  factory CandidateModel.fromJson(Map<String, dynamic> json) =>
      _$CandidateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
}

@JsonSerializable()
class ReplyData {
  final ReplyConfirmModel? data;

  factory ReplyData.fromJson(Map<String, dynamic> json) =>
      _$ReplyDataFromJson(json);

  ReplyData({required this.data});

  Map<String, dynamic> toJson() => _$ReplyDataToJson(this);
}

@JsonSerializable()
class ReplyConfirmModel {
  final int? price;

  ReplyConfirmModel({required this.price});

  factory ReplyConfirmModel.fromJson(Map<String, dynamic> json) =>
      _$ReplyConfirmModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReplyConfirmModelToJson(this);
}

// // RepliesModel
// @JsonSerializable()
// class RepliesModel {
//   final int count;
//   final CandidateModel? data;

//   RepliesModel({required this.count, required this.data});

//   factory RepliesModel.fromJson(Map<String, dynamic> json) =>
//       _$RepliesModelFromJson(json);

//   Map<String, dynamic> toJson() => _$RepliesModelToJson(this);
// }
