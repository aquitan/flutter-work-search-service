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
      (json['user_id'] as num).toInt(),
      json['text'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['id'] as num?)?.toInt(),
      json['state'] as String?,
      json['isBookmarked'] as bool,
      json['created_at'] as String,
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
      (json['user_id'] as num).toInt(),
      json['text'] as String?,
      (json['price'] as num?)?.toInt(),
      (json['id'] as num?)?.toInt(),
      json['state'] as String?,
      json['isBookmarked'] as bool,
      json['created_at'] as String,
      json['updated_at'] as String?,
      json['deleted_at'] as String?,
      chat: PublicationResponseChatsList.fromJson(
          json['chat'] as Map<String, dynamic>),
      publicationId: (json['publication_id'] as num).toInt(),
    );

Map<String, dynamic> _$PublicationCheckMyResponseToJson(
        PublicationCheckMyResponse instance) =>
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
      'chat': instance.chat,
    };

PublicationResponseChatsList _$PublicationResponseChatsListFromJson(
        Map<String, dynamic> json) =>
    PublicationResponseChatsList(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      executorUserId: json['executor_user_id'] as String,
      publicationId: json['publication_id'] as String,
      createdAt: json['created_at'] as String,
      publicationResponseId: json['publication_response_id'] as String,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$PublicationResponseChatsListToJson(
        PublicationResponseChatsList instance) =>
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
