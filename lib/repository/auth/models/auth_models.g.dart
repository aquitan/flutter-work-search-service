// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmCodeResponse _$ConfirmCodeResponseFromJson(Map<String, dynamic> json) =>
    ConfirmCodeResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
      data: ConfirCodeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfirmCodeResponseToJson(
        ConfirmCodeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };

ConfirCodeData _$ConfirCodeDataFromJson(Map<String, dynamic> json) =>
    ConfirCodeData(
      requestedAt: (json['requested_at'] as num).toInt(),
    );

Map<String, dynamic> _$ConfirCodeDataToJson(ConfirCodeData instance) =>
    <String, dynamic>{
      'requested_at': instance.requestedAt,
    };

SendConfirmCodeResponse _$SendConfirmCodeResponseFromJson(
        Map<String, dynamic> json) =>
    SendConfirmCodeResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$SendConfirmCodeResponseToJson(
        SendConfirmCodeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
