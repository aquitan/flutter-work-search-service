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
  int categoryId;

  String title;
  String description;

  @JsonKey(name: 'work_begin_date')
  String workBeginDate;

  @JsonKey(name: 'work_end_date')
  String workEndDate;

  String address;
  int price;

  @JsonKey(name: 'is_tender')
  bool isTender;

  @JsonKey(name: 'show_other_responses')
  bool showOtherResponses;

  @JsonKey(name: 'step_type')
  String stepType;

  // List<List> images;

  @JsonKey(name: 'user_id')
  int userId;

  @JsonKey(name: 'address_point')
  AddressPoint addressPoint;

  @JsonKey(name: 'executor_id')
  int? executorId;

  @JsonKey(name: 'start_price')
  int? startPrice;

  @JsonKey(name: 'step_value')
  int? stepValue;

  @JsonKey(name: 'rating_value_customer')
  int? ratingValueCustomer;

  @JsonKey(name: 'rating_value_executor')
  int? ratingValueExecutor;

  int id;
  int state;

  @JsonKey(name: 'is_b2b')
  bool isB2b;

  @JsonKey(name: 'deleted_at')
  String deletedAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'created_at')
  String createdAt;

  Order({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.workBeginDate,
    required this.workEndDate,
    required this.address,
    required this.price,
    this.isTender = false,
    this.showOtherResponses = false,
    required this.stepType,
    // required this.images,
    required this.userId,
    required this.addressPoint,
    required this.executorId,
    required this.startPrice,
    required this.stepValue,
    required this.ratingValueCustomer,
    required this.ratingValueExecutor,
    required this.id,
    required this.state,
    required this.isB2b,
    required this.deletedAt,
    required this.updatedAt,
    required this.createdAt,
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
  // var images;

  @JsonKey(name: 'is_tender')
  bool? isTender;

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
    // this.images,
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
