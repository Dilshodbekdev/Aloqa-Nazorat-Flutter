class ResendCodeBody {
  int? phone;
  int? id;

  ResendCodeBody({this.phone, this.id});

  ResendCodeBody.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['id'] = id;
    return data;
  }
}
