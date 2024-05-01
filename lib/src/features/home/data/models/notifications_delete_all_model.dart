class NotificationsDeleteAllModel {
  NotificationsDeleteAllModel({
    this.message,
  });

  NotificationsDeleteAllModel.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  NotificationsDeleteAllModel copyWith({
    String? message,
  }) =>
      NotificationsDeleteAllModel(
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
