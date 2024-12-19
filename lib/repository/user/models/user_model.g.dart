// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      email: json['email'] as String?,
      isCompany: json['is_company'] as bool,
      firstName: json['first_name'] as String?,
      fullName: json['full_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      isActiveEmail: json['is_active_email'] as bool,
      isActivePhone: json['is_active_phone'] as bool,
      locationId: (json['location_id'] as num?)?.toInt(),
      nodebbUid: (json['nodebb_uid'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      responseTemplate: json['response_template'] as String?,
      birthdayDate: json['birthday_date'] == null
          ? null
          : DateTime.parse(json['birthday_date'] as String),
      companyName: json['company_name'] as String?,
      companyInn: json['company_inn'] as String?,
      companyOgrn: json['company_ogrn'] as String?,
      companyKpp: json['company_kpp'] as String?,
      companyAddress: json['company_address'] as String?,
      companyRegDate: json['company_reg_date'] == null
          ? null
          : DateTime.parse(json['company_reg_date'] as String),
      employmentDates: json['employment_dates'] == null
          ? null
          : DateTime.parse(json['employment_dates'] as String),
      id: (json['id'] as num).toInt(),
      balance: (json['balance'] as num).toInt(),
      rating: (json['rating'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      isActive: json['is_active'] as bool,
      isIdentified: json['is_identified'] as bool,
      updatedAt: json['updated_at'] as String?,
      lastActiveAt: json['last_active_at'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'email': instance.email,
      'is_company': instance.isCompany,
      'first_name': instance.firstName,
      'full_name': instance.fullName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'last_active_at': instance.lastActiveAt,
      'is_active_email': instance.isActiveEmail,
      'is_active_phone': instance.isActivePhone,
      'location_id': instance.locationId,
      'nodebb_uid': instance.nodebbUid,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'response_template': instance.responseTemplate,
      'birthday_date': instance.birthdayDate?.toIso8601String(),
      'company_name': instance.companyName,
      'company_inn': instance.companyInn,
      'company_ogrn': instance.companyOgrn,
      'company_kpp': instance.companyKpp,
      'company_address': instance.companyAddress,
      'company_reg_date': instance.companyRegDate?.toIso8601String(),
      'employment_dates': instance.employmentDates?.toIso8601String(),
      'id': instance.id,
      'balance': instance.balance,
      'rating': instance.rating,
      'weight': instance.weight,
      'is_active': instance.isActive,
      'is_identified': instance.isIdentified,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
    };

MyUser _$MyUserFromJson(Map<String, dynamic> json) => MyUser(
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'data': instance.data,
    };

UserCategories _$UserCategoriesFromJson(Map<String, dynamic> json) =>
    UserCategories(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      counter: (json['counter'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserCategoriesToJson(UserCategories instance) =>
    <String, dynamic>{
      'data': instance.data,
      'counter': instance.counter,
    };
