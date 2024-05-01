class RegisterModel {
  String? code;
  Data? data;
  ResponseBroker? responseBroker;
  String? password;

  RegisterModel({
    this.code,
    this.data,
    this.responseBroker,
    this.password,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    password = json['password'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    responseBroker = json['response_broker'] != null
        ? ResponseBroker.fromJson(json['response_broker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['password'] = password;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
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

  Data({
    this.id,
    this.name,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.code,
  });

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
    return data;
  }
}

class ResponseBroker {
  bool? failed;
  bool? ok;
  int? status;
  bool? successful;

  ResponseBroker({this.failed, this.ok, this.status, this.successful});

  ResponseBroker.fromJson(Map<String, dynamic> json) {
    failed = json['failed'];
    ok = json['ok'];
    status = json['status'];
    successful = json['successful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['failed'] = failed;
    data['ok'] = ok;
    data['status'] = status;
    data['successful'] = successful;
    return data;
  }
}
