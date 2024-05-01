class UserData {
  UserData({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.code,
    this.codeVerifiedAt,
    this.isVerified,
    this.deletedAt,
    this.photo,
    this.birthDate,
    this.citizen,
    this.address,
    this.mobPhoneNo,
    this.birthPlace,
    this.midName,
    this.userType,
    this.sessId,
    this.retCd,
    this.deviceKey,
  });

  UserData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    code = json['code'];
    codeVerifiedAt = json['code_verified_at'];
    isVerified = json['is_verified'];
    deletedAt = json['deleted_at'];
    photo = json['photo'];
    birthDate = json['birth_date'];
    citizen = json['citizen'];
    address = json['address'];
    mobPhoneNo = json['mob_phone_no'];
    birthPlace = json['birth_place'];
    midName = json['mid_name'];
    userType = json['user_type'];
    sessId = json['sess_id'];
    retCd = json['ret_cd'];
    deviceKey = json['device_key'];
  }

  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? phone;
  String? code;
  String? codeVerifiedAt;
  bool? isVerified;
  String? deletedAt;
  String? photo;
  String? birthDate;
  String? citizen;
  String? address;
  String? mobPhoneNo;
  String? birthPlace;
  String? midName;
  String? userType;
  String? sessId;
  String? retCd;
  String? deviceKey;

  UserData copyWith({
    int? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    String? firstName,
    String? lastName,
    String? phone,
    String? code,
    String? codeVerifiedAt,
    bool? isVerified,
    String? deletedAt,
    String? photo,
    String? birthDate,
    String? citizen,
    String? address,
    String? mobPhoneNo,
    String? birthPlace,
    String? midName,
    String? userType,
    String? sessId,
    String? retCd,
    String? deviceKey,
  }) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        code: code ?? this.code,
        codeVerifiedAt: codeVerifiedAt ?? this.codeVerifiedAt,
        isVerified: isVerified ?? this.isVerified,
        deletedAt: deletedAt ?? this.deletedAt,
        photo: photo ?? this.photo,
        birthDate: birthDate ?? this.birthDate,
        citizen: citizen ?? this.citizen,
        address: address ?? this.address,
        mobPhoneNo: mobPhoneNo ?? this.mobPhoneNo,
        birthPlace: birthPlace ?? this.birthPlace,
        midName: midName ?? this.midName,
        userType: userType ?? this.userType,
        sessId: sessId ?? this.sessId,
        retCd: retCd ?? this.retCd,
        deviceKey: deviceKey ?? this.deviceKey,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['phone'] = phone;
    map['code'] = code;
    map['code_verified_at'] = codeVerifiedAt;
    map['is_verified'] = isVerified;
    map['deleted_at'] = deletedAt;
    map['photo'] = photo;
    map['birth_date'] = birthDate;
    map['citizen'] = citizen;
    map['address'] = address;
    map['mob_phone_no'] = mobPhoneNo;
    map['birth_place'] = birthPlace;
    map['mid_name'] = midName;
    map['user_type'] = userType;
    map['sess_id'] = sessId;
    map['ret_cd'] = retCd;
    map['device_key'] = deviceKey;
    return map;
  }
}