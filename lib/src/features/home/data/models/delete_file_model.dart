class DeleteFileModel {
  DeleteFileModel({
    this.status,
    this.data,
    this.code,
  });

  DeleteFileModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'];
    code = json['code'];
  }

  String? status;
  String? data;
  String? code;

  DeleteFileModel copyWith({
    String? status,
    String? data,
    String? code,
  }) =>
      DeleteFileModel(
        status: status ?? this.status,
        data: data ?? this.data,
        code: code ?? this.code,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data;
    map['code'] = code;
    return map;
  }
}
