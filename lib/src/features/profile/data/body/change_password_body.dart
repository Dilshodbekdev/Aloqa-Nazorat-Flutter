class ChangePasswordBody {
  String? password;
  String? firstName;
  String? lastName;

  ChangePasswordBody({this.password, this.firstName, this.lastName});

  ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
