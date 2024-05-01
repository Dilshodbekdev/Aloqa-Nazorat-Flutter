class UploadFileModel {
  UploadFileModel({
      this.status, 
      this.code, 
      this.data, 
      this.message,});

  UploadFileModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  String? status;
  String? code;
  Data? data;
  String? message;
UploadFileModel copyWith({  String? status,
  String? code,
  Data? data,
  String? message,
}) => UploadFileModel(  status: status ?? this.status,
  code: code ?? this.code,
  data: data ?? this.data,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class Data {
  Data({
      this.userId, 
      this.file, 
      this.fileName, 
      this.filePath, 
      this.fileExtension, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    userId = json['user_id'];
    file = json['file'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    fileExtension = json['file_extension'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  int? userId;
  String? file;
  String? fileName;
  String? filePath;
  String? fileExtension;
  String? updatedAt;
  String? createdAt;
  int? id;
Data copyWith({
  int? userId,
  String? file,
  String? fileName,
  String? filePath,
  String? fileExtension,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  userId: userId ?? this.userId,
  file: file ?? this.file,
  fileName: fileName ?? this.fileName,
  filePath: filePath ?? this.filePath,
  fileExtension: fileExtension ?? this.fileExtension,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['file'] = file;
    map['file_name'] = fileName;
    map['file_path'] = filePath;
    map['file_extension'] = fileExtension;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}