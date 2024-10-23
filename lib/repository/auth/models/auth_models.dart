class CheckLoginModel {}

class User {
  int? id;
  int? locationId;
  int? nodebbUid;
  String? avatar;
  String? email;
  String? phone;
  bool? isCompany;
  String? firstName;
  String? middleName;
  String? lastName;
  String? responseTemplate;
  String? fullName;
  String? birthdayDate;
  String? companyName;
  String? companyInn;
  String? companyOgrn;
  String? companyKpp;
  String? companyAddress;
  String? companyRegDate;
  int? balance;
  int? rating;
  int? weight;
  String? employmentDates;
  bool? isActive;
  bool? isIdentified;
  bool? isActiveEmail;
  bool? isActivePhone;
  String? lastActiveAt;
  String? updatedAt;
  String? createdAt;

  User(
      {this.id,
      this.locationId,
      this.nodebbUid,
      this.avatar,
      this.email,
      this.phone,
      this.isCompany,
      this.firstName,
      this.middleName,
      this.lastName,
      this.responseTemplate,
      this.fullName,
      this.birthdayDate,
      this.companyName,
      this.companyInn,
      this.companyOgrn,
      this.companyKpp,
      this.companyAddress,
      this.companyRegDate,
      this.balance,
      this.rating,
      this.weight,
      this.employmentDates,
      this.isActive,
      this.isIdentified,
      this.isActiveEmail,
      this.isActivePhone,
      this.lastActiveAt,
      this.updatedAt,
      this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int?,
      locationId: json['location_id'] as int?,
      nodebbUid: json['nodebb_uid'] as int?,
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isCompany: json['is_company'] as bool?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      responseTemplate: json['response_template'] as String?,
      fullName: json['full_name'] as String?,
      birthdayDate: json['birthday_date'] as String?,
      companyName: json['company_name'] as String?,
      companyInn: json['company_inn'] as String?,
      companyOgrn: json['company_ogrn'] as String?,
      companyKpp: json['company_kpp'] as String?,
      companyAddress: json['company_address'] as String?,
      companyRegDate: json['company_reg_date'] as String?,
      balance: json['balance'] as int?,
      rating: json['rating'] as int?,
      weight: json['weight'] as int?,
      employmentDates: json['employment_dates'] as String?,
      isActive: json['is_active'] as bool?,
      isIdentified: json['is_identified'] as bool?,
      isActiveEmail: json['is_active_email'] as bool?,
      isActivePhone: json['is_active_phone'] as bool?,
      lastActiveAt: json['last_active_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
    );
  }
}
