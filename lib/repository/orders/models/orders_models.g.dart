// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      data: json['data'] == null
          ? null
          : Order.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      categoryId: (json['category_id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      workBeginDate: json['work_begin_date'] as String,
      workEndDate: json['work_end_date'] as String,
      address: json['address'] as String,
      price: (json['price'] as num).toInt(),
      isTender: json['is_tender'] as bool? ?? false,
      showOtherResponses: json['show_other_responses'] as bool? ?? false,
      stepType: json['step_type'] as String,
      userId: (json['user_id'] as num).toInt(),
      addressPoint:
          AddressPoint.fromJson(json['address_point'] as Map<String, dynamic>),
      executorId: (json['executor_id'] as num?)?.toInt(),
      startPrice: (json['start_price'] as num?)?.toInt(),
      stepValue: (json['step_value'] as num?)?.toInt(),
      ratingValueCustomer: (json['rating_value_customer'] as num?)?.toInt(),
      ratingValueExecutor: (json['rating_value_executor'] as num?)?.toInt(),
      id: (json['id'] as num).toInt(),
      state: (json['state'] as num).toInt(),
      isB2b: json['is_b2b'] as bool,
      deletedAt: json['deleted_at'] as String,
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'category_id': instance.categoryId,
      'title': instance.title,
      'description': instance.description,
      'work_begin_date': instance.workBeginDate,
      'work_end_date': instance.workEndDate,
      'address': instance.address,
      'price': instance.price,
      'is_tender': instance.isTender,
      'show_other_responses': instance.showOtherResponses,
      'step_type': instance.stepType,
      'user_id': instance.userId,
      'address_point': instance.addressPoint,
      'executor_id': instance.executorId,
      'start_price': instance.startPrice,
      'step_value': instance.stepValue,
      'rating_value_customer': instance.ratingValueCustomer,
      'rating_value_executor': instance.ratingValueExecutor,
      'id': instance.id,
      'state': instance.state,
      'is_b2b': instance.isB2b,
      'deleted_at': instance.deletedAt,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };

AddressPoint _$AddressPointFromJson(Map<String, dynamic> json) => AddressPoint(
      coordinates: json['coordinates'] as List<dynamic>?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AddressPointToJson(AddressPoint instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
    };

OrderCreationDto _$OrderCreationDtoFromJson(Map<String, dynamic> json) =>
    OrderCreationDto(
      address: json['address'] as String?,
      addressLat: json['address_lat'] as String?,
      addressLon: json['address_lon'] as String?,
      addressPoint: json['address_point'] as List<dynamic>?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      isTender: json['is_tender'] as bool?,
      price: (json['price'] as num?)?.toInt(),
      showOtherResponses: json['show_other_responses'] as bool?,
      stepType: json['step_type'] as String?,
      title: json['title'] as String?,
      workBeginDate: json['work_begin_date'] as String?,
      workEndDate: json['work_end_date'] as String?,
    );

Map<String, dynamic> _$OrderCreationDtoToJson(OrderCreationDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_lat': instance.addressLat,
      'address_lon': instance.addressLon,
      'address_point': instance.addressPoint,
      'category_id': instance.categoryId,
      'description': instance.description,
      'is_tender': instance.isTender,
      'price': instance.price,
      'show_other_responses': instance.showOtherResponses,
      'step_type': instance.stepType,
      'title': instance.title,
      'work_begin_date': instance.workBeginDate,
      'work_end_date': instance.workEndDate,
    };
