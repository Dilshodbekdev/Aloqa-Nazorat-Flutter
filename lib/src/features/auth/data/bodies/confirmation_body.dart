class ConfirmationBody {
  String? code;
  int? id;

  ConfirmationBody({this.code, this.id});

  ConfirmationBody.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['id'] = id;
    return data;
  }
}