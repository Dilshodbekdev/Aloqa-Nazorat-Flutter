import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_data.dart';

class TicketModel {
  TicketModel({
    this.status,
    this.code,
    this.data,
  });

  TicketModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null
        ? TicketData.fromJson(json['data'])
        : null;
  }

  String? status;
  String? code;
  TicketData? data;

  TicketModel copyWith({
    String? status,
    String? code,
    TicketData? data,
  }) =>
      TicketModel(
        status: status ?? this.status,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}