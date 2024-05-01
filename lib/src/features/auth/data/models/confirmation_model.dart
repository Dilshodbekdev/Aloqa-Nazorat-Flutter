import 'package:aloqa_nazorat/src/features/auth/data/models/user_data.dart';

class ConfirmationModel {
  ConfirmationModel({
    this.status,
    this.data,
    this.token,
    this.message,
  });

  ConfirmationModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    token = json['token'];
    message = json['message'];
  }

  String? status;
  UserData? data;
  String? token;
  String? message;

  ConfirmationModel copyWith({
    String? status,
    UserData? data,
    String? token,
    String? message,
  }) =>
      ConfirmationModel(
        status: status ?? this.status,
        data: data ?? this.data,
        token: token ?? this.token,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    map['message'] = message;
    return map;
  }
}
