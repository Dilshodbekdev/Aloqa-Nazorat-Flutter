/// status : "success"
/// message : "Profile deleted"

class DeleteAccountModel {
  DeleteAccountModel({
    this.status,
    this.message,
  });

  DeleteAccountModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }

  String? status;
  String? message;

  DeleteAccountModel copyWith({
    String? status,
    String? message,
  }) =>
      DeleteAccountModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }
}
