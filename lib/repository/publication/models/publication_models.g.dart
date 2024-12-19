// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) =>
    PublicationModel(
      data: Order.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicationModelToJson(PublicationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PublicationResponse _$PublicationResponseFromJson(Map<String, dynamic> json) =>
    PublicationResponse(
      data: PublicationResponseModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicationResponseToJson(
        PublicationResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

PublicationResponseModel _$PublicationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PublicationResponseModel(
      (json['user_id'] as num?)?.toInt(),
      json['text'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['id'] as num?)?.toInt(),
      json['state'] as String?,
      json['isBookmarked'] as bool?,
      json['created_at'] as String?,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
      publicationId: (json['publication_id'] as num).toInt(),
    );

Map<String, dynamic> _$PublicationResponseModelToJson(
        PublicationResponseModel instance) =>
    <String, dynamic>{
      'publication_id': instance.publicationId,
      'user_id': instance.userId,
      'text': instance.text,
      'price': instance.price,
      'id': instance.id,
      'state': instance.state,
      'isBookmarked': instance.isBookmarked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

PublicationCheckMyResponse _$PublicationCheckMyResponseFromJson(
        Map<String, dynamic> json) =>
    PublicationCheckMyResponse(
      chat: json['chat'] == null
          ? null
          : PublicationResponseChat.fromJson(
              json['chat'] as Map<String, dynamic>),
      publicationId: (json['publication_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      text: json['text'] as String?,
      price: (json['price'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      state: json['state'] as String?,
      isBookmarked: json['isBookmarked'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PublicationCheckMyResponseToJson(
        PublicationCheckMyResponse instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'publication_id': instance.publicationId,
      'user_id': instance.userId,
      'text': instance.text,
      'price': instance.price,
      'id': instance.id,
      'state': instance.state,
      'isBookmarked': instance.isBookmarked,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

PublicationResponseChat _$PublicationResponseChatFromJson(
        Map<String, dynamic> json) =>
    PublicationResponseChat(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      executorUserId: (json['executor_user_id'] as num?)?.toInt(),
      publicationId: (json['publication_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      publicationResponseId: (json['publication_response_id'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PublicationResponseChatToJson(
        PublicationResponseChat instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'executor_user_id': instance.executorUserId,
      'publication_id': instance.publicationId,
      'created_at': instance.createdAt,
      'publication_response_id': instance.publicationResponseId,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

CandidatesModel _$CandidatesModelFromJson(Map<String, dynamic> json) =>
    CandidatesModel(
      count: (json['count'] as num).toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CandidatesModelToJson(CandidatesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
    };

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) =>
    CandidateModel(
      chat: json['chat'] == null
          ? null
          : PublicationResponseChat.fromJson(
              json['chat'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      deletedAt: json['deleted_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      isBookmarked: json['isBookmarked'] as bool?,
      publicationId: (json['publication_id'] as num?)?.toInt(),
      state: json['state'] as String?,
      text: json['text'] as String?,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      userId: (json['user_id'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'created_at': instance.createdAt,
      'deleted_at': instance.deletedAt,
      'id': instance.id,
      'price': instance.price,
      'isBookmarked': instance.isBookmarked,
      'publication_id': instance.publicationId,
      'state': instance.state,
      'text': instance.text,
      'user': instance.user,
      'user_id': instance.userId,
      'updated_at': instance.updatedAt,
    };

ReplyData _$ReplyDataFromJson(Map<String, dynamic> json) => ReplyData(
      data: json['data'] == null
          ? null
          : ReplyConfirmModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReplyDataToJson(ReplyData instance) => <String, dynamic>{
      'data': instance.data,
    };

ReplyConfirmModel _$ReplyConfirmModelFromJson(Map<String, dynamic> json) =>
    ReplyConfirmModel(
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReplyConfirmModelToJson(ReplyConfirmModel instance) =>
    <String, dynamic>{
      'price': instance.price,
    };
