import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

// User Model
@JsonSerializable()
class UserModel {
  String? email;
  String? password;

  @JsonKey(name: 'is_company')
  bool? isCompany;

  @JsonKey(name: 'first_name')
  String? firstName;

  @JsonKey(name: 'middle_name')
  String? middleName;

  @JsonKey(name: 'last_name')
  String? lastName;

  @JsonKey(name: 'is_active_email')
  bool? isActiveEmail;

  @JsonKey(name: 'is_active_phone')
  bool? isActivePhone;

  @JsonKey(name: 'password_hash')
  String? passwordHash;

  @JsonKey(name: 'location_id')
  Object? locationId;

  @JsonKey(name: 'parent_id')
  int? parentId;

  @JsonKey(name: 'nodebb_uid')
  int? nodebbUid;

  String? avatar;
  String? phone;

  @JsonKey(name: 'passport_hash')
  String? passportHash;

  @JsonKey(name: 'response_template')
  String? responseTemplate;

  @JsonKey(name: 'birthday_date')
  DateTime? birthdayDate;

  @JsonKey(name: 'company_name')
  String? companyName;

  @JsonKey(name: 'company_inn')
  String? companyInn;

  @JsonKey(name: 'company_ogrn')
  String? companyOgrn;

  @JsonKey(name: 'company_kpp')
  String? companyKpp;

  @JsonKey(name: 'company_address')
  String? companyAddress;

  @JsonKey(name: 'company_reg_date')
  DateTime? companyRegDate;

  @JsonKey(name: 'employment_dates')
  DateTime? employmentDates;

  int? id;
  int? balance;
  int? rating;
  int? weight;

  @JsonKey(name: 'is_active')
  bool? isActive;

  @JsonKey(name: 'is_identified')
  bool? isIdentified;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'created_at')
  String? createdAt;

  UserModel(
      {this.email,
      this.password,
      this.isCompany,
      this.firstName,
      this.middleName,
      this.lastName,
      this.isActiveEmail,
      this.isActivePhone,
      this.passwordHash,
      this.locationId,
      this.parentId,
      this.nodebbUid,
      this.avatar,
      this.phone,
      this.passportHash,
      this.responseTemplate,
      this.birthdayDate,
      this.companyName,
      this.companyInn,
      this.companyOgrn,
      this.companyKpp,
      this.companyAddress,
      this.companyRegDate,
      this.employmentDates,
      this.id,
      this.balance,
      this.rating,
      this.weight,
      this.isActive,
      this.isIdentified,
      this.updatedAt,
      this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
