class CreateTicketModel {
  CreateTicketModel({
      this.status, 
      this.code, 
      this.data, 
      this.files,});

  CreateTicketModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    files = json['files'] != null ? json['files'].cast<int>() : [];
  }
  String? status;
  String? code;
  Data? data;
  List<int>? files;
CreateTicketModel copyWith({  String? status,
  String? code,
  Data? data,
  List<int>? files,
}) => CreateTicketModel(  status: status ?? this.status,
  code: code ?? this.code,
  data: data ?? this.data,
  files: files ?? this.files,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['files'] = files;
    return map;
  }
}

class Data {
  Data({
      this.isSend, 
      this.firstName, 
      this.lastName, 
      this.address, 
      this.description, 
      this.ticketRegionId, 
      this.ticketDistrictId, 
      this.referenceId, 
      this.referenceParentId, 
      this.letterId, 
      this.code, 
      this.userType, 
      this.source, 
      this.sentAt, 
      this.userId, 
      this.phone, 
      this.middleName, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  Data.fromJson(dynamic json) {
    isSend = json['is_send'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    description = json['description'];
    ticketRegionId = json['ticket_region_id'];
    ticketDistrictId = json['ticket_district_id'];
    referenceId = json['reference_id'];
    referenceParentId = json['reference_parent_id'];
    letterId = json['letter_id'];
    code = json['code'];
    userType = json['user_type'];
    source = json['source'];
    sentAt = json['sent_at'];
    userId = json['user_id'];
    phone = json['phone'];
    middleName = json['middle_name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  bool? isSend;
  String? firstName;
  String? lastName;
  String? address;
  String? description;
  int? ticketRegionId;
  int? ticketDistrictId;
  int? referenceId;
  int? referenceParentId;
  int? letterId;
  String? code;
  String? userType;
  String? source;
  String? sentAt;
  int? userId;
  String? phone;
  String? middleName;
  String? updatedAt;
  String? createdAt;
  int? id;
Data copyWith({  bool? isSend,
  String? firstName,
  String? lastName,
  String? address,
  String? description,
  int? ticketRegionId,
  int? ticketDistrictId,
  int? referenceId,
  int? referenceParentId,
  int? letterId,
  String? code,
  String? userType,
  String? source,
  String? sentAt,
  int? userId,
  String? phone,
  String? middleName,
  String? updatedAt,
  String? createdAt,
  int? id,
}) => Data(  isSend: isSend ?? this.isSend,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  address: address ?? this.address,
  description: description ?? this.description,
  ticketRegionId: ticketRegionId ?? this.ticketRegionId,
  ticketDistrictId: ticketDistrictId ?? this.ticketDistrictId,
  referenceId: referenceId ?? this.referenceId,
  referenceParentId: referenceParentId ?? this.referenceParentId,
  letterId: letterId ?? this.letterId,
  code: code ?? this.code,
  userType: userType ?? this.userType,
  source: source ?? this.source,
  sentAt: sentAt ?? this.sentAt,
  userId: userId ?? this.userId,
  phone: phone ?? this.phone,
  middleName: middleName ?? this.middleName,
  updatedAt: updatedAt ?? this.updatedAt,
  createdAt: createdAt ?? this.createdAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_send'] = isSend;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['address'] = address;
    map['description'] = description;
    map['ticket_region_id'] = ticketRegionId;
    map['ticket_district_id'] = ticketDistrictId;
    map['reference_id'] = referenceId;
    map['reference_parent_id'] = referenceParentId;
    map['letter_id'] = letterId;
    map['code'] = code;
    map['user_type'] = userType;
    map['source'] = source;
    map['sent_at'] = sentAt;
    map['user_id'] = userId;
    map['phone'] = phone;
    map['middle_name'] = middleName;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}