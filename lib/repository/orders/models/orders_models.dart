import 'package:ia_ma/repository/categories/models/categories_model.dart';
import 'package:ia_ma/repository/user/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_models.g.dart';

@JsonSerializable()
class OrderModel {
  Order? data;

  OrderModel({this.data});

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: 'category_id')
  int? categoryId;

  String? title;
  String? description;

  @JsonKey(name: 'work_begin_date')
  String? workBeginDate;

  @JsonKey(name: 'work_end_date')
  String? workEndDate;

  String? address;
  int? price;

  @JsonKey(name: 'is_tender')
  String? isTender;

  @JsonKey(name: 'show_other_responses')
  bool? showOtherResponses;

  @JsonKey(name: 'step_type')
  String? stepType;

  List<dynamic>? images;

  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'address_point')
  AddressPoint? addressPoint;

  @JsonKey(name: 'executor_id')
  int? executorId;

  @JsonKey(name: 'start_price')
  String? startPrice;

  @JsonKey(name: 'step_value')
  String? stepValue;

  @JsonKey(name: 'rating_value_customer')
  int? ratingValueCustomer;

  @JsonKey(name: 'rating_value_executor')
  int? ratingValueExecutor;

  int? id;
  int? state;

  @JsonKey(name: 'is_b2b')
  bool? isB2b;

  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'created_at')
  String? createdAt;

  UserModel? user;

  Category? category;

  Order({
    this.categoryId,
    this.title,
    this.description,
    this.workBeginDate,
    this.workEndDate,
    this.address,
    this.price,
    this.isTender,
    this.showOtherResponses,
    this.stepType,
    this.images,
    this.userId,
    this.addressPoint,
    this.executorId,
    this.startPrice,
    this.stepValue,
    this.ratingValueCustomer,
    this.ratingValueExecutor,
    this.id,
    this.state,
    this.isB2b,
    this.deletedAt,
    this.updatedAt,
    this.createdAt,
    this.user,
    this.category,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class AddressPoint {
  AddressPoint({this.coordinates, this.type});

  String? type;
  List<dynamic>? coordinates;

  factory AddressPoint.fromJson(Map<String, dynamic> json) =>
      _$AddressPointFromJson(json);

  Map<String, dynamic> toJson() => _$AddressPointToJson(this);
}

@JsonSerializable()
class OrderCreationDto {
  String? address;

  @JsonKey(name: 'address_lat')
  String? addressLat;

  @JsonKey(name: 'address_lon')
  String? addressLon;

  @JsonKey(name: 'address_point')
  List<dynamic>? addressPoint;

  @JsonKey(name: 'category_id')
  int? categoryId;

  String? description;
  ImagesList? images;

  @JsonKey(name: 'is_tender')
  String? isTender;

  int? price;

  @JsonKey(name: 'show_other_responses')
  bool? showOtherResponses;

  @JsonKey(name: 'step_type')
  String? stepType;

  String? title;

  @JsonKey(name: 'work_begin_date')
  String? workBeginDate;

  @JsonKey(name: 'work_end_date')
  String? workEndDate;

  OrderCreationDto({
    this.address,
    this.addressLat,
    this.addressLon,
    this.addressPoint,
    this.categoryId,
    this.description,
    this.images,
    this.isTender,
    this.price,
    this.showOtherResponses,
    this.stepType,
    this.title,
    this.workBeginDate,
    this.workEndDate,
  });

  factory OrderCreationDto.fromJson(Map<String, dynamic> json) =>
      _$OrderCreationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderCreationDtoToJson(this);
}



@JsonSerializable()
class OrdersInList {
  OrdersInList({this.data});

  List<Order>? data;

  factory OrdersInList.fromJson(Map<String, dynamic> json) =>
      _$OrdersInListFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersInListToJson(this);
}

@JsonSerializable()
class ImagesList {

  List<Map<String, dynamic>>? images;

  ImagesList({required this.images});


  factory ImagesList.fromJson(Map<String, dynamic> json) =>
      _$ImagesListFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesListToJson(this);
}