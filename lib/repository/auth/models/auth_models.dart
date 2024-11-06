import 'package:json_annotation/json_annotation.dart';

part 'auth_models.g.dart';

// User Model
@JsonSerializable()
class User {
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

  User(
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


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

// Request Confirm Code Model
@JsonSerializable()
class ConfirmCodeResponse {
  ConfirmCodeResponse(
      {required this.message, required this.success, required this.data});

  ConfirCodeData data;
  final String message;
  final bool success;

  factory ConfirmCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmCodeResponseToJson(this);
}

@JsonSerializable()
class ConfirCodeData {
  ConfirCodeData({required this.requestedAt});

  @JsonKey(name: 'requested_at')
  final int requestedAt;

  factory ConfirCodeData.fromJson(Map<String, dynamic> json) =>
      _$ConfirCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirCodeDataToJson(this);
}

// Response Send Confirm Code Model
@JsonSerializable()
class SendConfirmCodeResponse {
  SendConfirmCodeResponse({required this.message, required this.success});

  final String message;
  final bool success;

  factory SendConfirmCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendConfirmCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendConfirmCodeResponseToJson(this);
}

// Register Model
@JsonSerializable()
class RegisterUserResponse {
  RegisterUserResponse({required this.user, required this.token});

  final User user;
  final Token token;

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
}

// Token Model
@JsonSerializable()
class Token {
  Token({required this.accessToken, required this.expiresIn});

  final String accessToken;
  final int expiresIn;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

// SignIn Model
@JsonSerializable()
class SignInUserResponse {
  SignInUserResponse({required this.user, required this.token});

  final User user;
  final Token token;

  factory SignInUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInUserResponseToJson(this);
}

// Reset Password Model
@JsonSerializable()
class ResetPasswordResponse {
  ResetPasswordResponse({required this.message, required this.success});

  final String message;
  final bool success;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}
