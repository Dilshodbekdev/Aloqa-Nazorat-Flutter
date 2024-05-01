import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';

class ResendCodeModel {
  ResendCodeModel({
    this.status,
    this.data,
    this.code,
  });

  ResendCodeModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    code = json['code'];
  }

  String? status;
  UserData? data;
  String? code;

  ResendCodeModel copyWith({String? status, UserData? data, String? code}) =>
      ResendCodeModel(
        status: status ?? this.status,
        data: data ?? this.data,
        code: code ?? this.code,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['code'] = code;
    return map;
  }
}
