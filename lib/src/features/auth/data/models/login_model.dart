class LoginModel {
  String? status;
  String? message;
  Data? data;
  String? token;

  LoginModel({this.status, this.message, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
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
  String? midName;

  Data(
      {this.id,
        this.name,
        this.email,
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
        this.midName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
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
    midName = json['mid_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['code'] = code;
    data['code_verified_at'] = codeVerifiedAt;
    data['is_verified'] = isVerified;
    data['deleted_at'] = deletedAt;
    data['photo'] = photo;
    data['mid_name'] = midName;
    return data;
  }
}