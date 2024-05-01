class RegisterBody {
  String? firstName;
  String? lastName;
  String? midName;
  String? password;
  String? phone;
  String? deviceKey;

  RegisterBody({
    this.firstName,
    this.lastName,
    this.midName,
    this.password,
    this.phone,
    this.deviceKey,
  });

  RegisterBody.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    midName = json['mid_name'];
    phone = json['phone'];
    password = json['password'];
    deviceKey = json['device_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mid_name'] = midName;
    data['phone'] = phone;
    data['password'] = password;
    data['device_key'] = deviceKey;
    return data;
  }
}
