import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_data.dart';

class TicketsModel {
  TicketsModel({
    this.status,
    this.code,
    this.data,
  });

  TicketsModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TicketData.fromJson(v));
      });
    }
  }

  String? status;
  String? code;
  List<TicketData>? data;

  TicketsModel copyWith({
    String? status,
    String? code,
    List<TicketData>? data,
  }) =>
      TicketsModel(
        status: status ?? this.status,
        code: code ?? this.code,
        data: data ?? this.data,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
