import 'package:aloqa_nazorat/src/features/reference/data/models/name.dart';

class TicketData {
  TicketData({
    this.id,
    this.code,
    this.comment,
    this.firstName,
    this.lastName,
    this.middleName,
    this.address,
    this.phone,
    this.userType,
    this.source,
    this.description,
    this.executions,
    this.ticketRegionId,
    this.ticketDistrictId,
    this.referenceParentId,
    this.referenceId,
    this.isSend,
    this.sentAt,
    this.createdAt,
    this.updatedAt,
    this.deadline,
    this.responseFiles,
    this.userFiles,
    this.status,
    this.ticketRegion,
    this.ticketDistrict,
    this.referenceParent,
    this.reference,
  });

  TicketData.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    comment = json['comment'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    address = json['address'];
    phone = json['phone'];
    userType = json['user_type'];
    source = json['source'];
    description = json['description'];
    if (json['executions'] != null) {
      executions = [];
      json['executions'].forEach((v) {
        executions?.add(Execution.fromJson(v));
      });
    }
    ticketRegionId = json['ticket_region_id'];
    ticketDistrictId = json['ticket_district_id'];
    referenceParentId = json['reference_parent_id'];
    referenceId = json['reference_id'];
    isSend = json['is_send'];
    sentAt = json['sent_at'];
    createdAt = json['created_at'];
    deadline = json['deadline'];
    updatedAt = json['updated_at'];
    if (json['files'] != null) {
      responseFiles = [];
      json['files'].forEach((v) {
        responseFiles?.add(ResponseFile.fromJson(v));
      });
    }
    if (json['user_files'] != null) {
      userFiles = [];
      json['user_files'].forEach((v) {
        userFiles?.add(UserFile.fromJson(v));
      });
    }
    status = json['status'];
    ticketRegion = json['ticket_region'] != null
        ? TicketRegion.fromJson(json['ticket_region'])
        : null;
    ticketDistrict = json['ticket_district'] != null
        ? TicketDistrict.fromJson(json['ticket_district'])
        : null;
    referenceParent = json['reference_parent'] != null
        ? ReferenceParent.fromJson(json['reference_parent'])
        : null;
    reference = json['reference'] != null
        ? Reference.fromJson(json['reference'])
        : null;
  }

  int? id;
  String? code;
  String? comment;
  String? firstName;
  String? lastName;
  String? middleName;
  String? address;
  String? phone;
  String? userType;
  String? source;
  String? description;
  List<Execution>? executions;
  int? ticketRegionId;
  int? ticketDistrictId;
  int? referenceParentId;
  int? referenceId;
  bool? isSend;
  String? sentAt;
  String? createdAt;
  String? updatedAt;
  String? deadline;
  List<ResponseFile>? responseFiles;
  List<UserFile>? userFiles;
  String? status;
  TicketRegion? ticketRegion;
  TicketDistrict? ticketDistrict;
  ReferenceParent? referenceParent;
  Reference? reference;

  TicketData copyWith({
    int? id,
    String? code,
    String? comment,
    String? firstName,
    String? lastName,
    String? middleName,
    String? address,
    String? phone,
    String? userType,
    String? source,
    String? description,
    List<Execution>? executions,
    int? ticketRegionId,
    int? ticketDistrictId,
    int? referenceParentId,
    int? referenceId,
    bool? isSend,
    String? sentAt,
    String? createdAt,
    String? deadline,
    String? updatedAt,
    List<ResponseFile>? responseFiles,
    List<UserFile>? userFiles,
    String? status,
    TicketRegion? ticketRegion,
    TicketDistrict? ticketDistrict,
    ReferenceParent? referenceParent,
    Reference? reference,
  }) =>
      TicketData(
        id: id ?? this.id,
        code: code ?? this.code,
        comment: comment ?? this.comment,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        middleName: middleName ?? this.middleName,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        userType: userType ?? this.userType,
        source: source ?? this.source,
        description: description ?? this.description,
        executions: executions ?? this.executions,
        ticketRegionId: ticketRegionId ?? this.ticketRegionId,
        ticketDistrictId: ticketDistrictId ?? this.ticketDistrictId,
        referenceParentId: referenceParentId ?? this.referenceParentId,
        referenceId: referenceId ?? this.referenceId,
        isSend: isSend ?? this.isSend,
        sentAt: sentAt ?? this.sentAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deadline: deadline ?? this.deadline,
        responseFiles: responseFiles ?? this.responseFiles,
        userFiles: userFiles ?? this.userFiles,
        status: status ?? this.status,
        ticketRegion: ticketRegion ?? this.ticketRegion,
        ticketDistrict: ticketDistrict ?? this.ticketDistrict,
        referenceParent: referenceParent ?? this.referenceParent,
        reference: reference ?? this.reference,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['comment'] = comment;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['middle_name'] = middleName;
    map['address'] = address;
    map['phone'] = phone;
    map['user_type'] = userType;
    map['source'] = source;
    map['description'] = description;
    if (executions != null) {
      map['executions'] = executions?.map((v) => v.toJson()).toList();
    }
    map['ticket_region_id'] = ticketRegionId;
    map['ticket_district_id'] = ticketDistrictId;
    map['reference_parent_id'] = referenceParentId;
    map['reference_id'] = referenceId;
    map['is_send'] = isSend;
    map['sent_at'] = sentAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deadline'] = deadline;
    if (responseFiles != null) {
      map['files'] = responseFiles?.map((v) => v.toJson()).toList();
    }
    if (userFiles != null) {
      map['user_files'] = userFiles?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    if (ticketRegion != null) {
      map['ticket_region'] = ticketRegion?.toJson();
    }
    if (ticketDistrict != null) {
      map['ticket_district'] = ticketDistrict?.toJson();
    }
    if (referenceParent != null) {
      map['reference_parent'] = referenceParent?.toJson();
    }
    if (reference != null) {
      map['reference'] = reference?.toJson();
    }
    return map;
  }
}

class Reference {
  Reference({
    this.id,
    this.name,
  });

  Reference.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  num? id;
  Name? name;

  Reference copyWith({
    num? id,
    Name? name,
  }) =>
      Reference(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    return map;
  }
}

class ReferenceParent {
  ReferenceParent({
    this.id,
    this.name,
  });

  ReferenceParent.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  num? id;
  Name? name;

  ReferenceParent copyWith({
    num? id,
    Name? name,
  }) =>
      ReferenceParent(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    return map;
  }
}

class TicketDistrict {
  TicketDistrict({
    this.id,
    this.name,
  });

  TicketDistrict.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  num? id;
  Name? name;

  TicketDistrict copyWith({
    num? id,
    Name? name,
  }) =>
      TicketDistrict(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    return map;
  }
}

class TicketRegion {
  TicketRegion({
    this.id,
    this.name,
  });

  TicketRegion.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

  num? id;
  Name? name;

  TicketRegion copyWith({
    num? id,
    Name? name,
  }) =>
      TicketRegion(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    return map;
  }
}

class UserFile {
  UserFile({
    this.id,
    this.userId,
    this.extraTicketId,
    this.ticketId,
    this.file,
    this.fileName,
    this.fileExtension,
    this.filePath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  UserFile.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    extraTicketId = json['extra_ticket_id'];
    ticketId = json['ticket_id'];
    file = json['file'];
    fileName = json['file_name'];
    fileExtension = json['file_extension'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  int? id;
  int? userId;
  int? extraTicketId;
  int? ticketId;
  String? file;
  String? fileName;
  String? fileExtension;
  String? filePath;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  UserFile copyWith({
    int? id,
    int? userId,
    int? extraTicketId,
    int? ticketId,
    String? file,
    String? fileName,
    String? fileExtension,
    String? filePath,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) =>
      UserFile(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        extraTicketId: extraTicketId ?? this.extraTicketId,
        ticketId: ticketId ?? this.ticketId,
        file: file ?? this.file,
        fileName: fileName ?? this.fileName,
        fileExtension: fileExtension ?? this.fileExtension,
        filePath: filePath ?? this.filePath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['extra_ticket_id'] = extraTicketId;
    map['ticket_id'] = ticketId;
    map['file'] = file;
    map['file_name'] = fileName;
    map['file_extension'] = fileExtension;
    map['file_path'] = filePath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}

class ResponseFile {
  ResponseFile(
      {this.id,
      this.ticketId,
      this.file,
      this.fileName,
      this.fileExtension,
      this.filePath,
      this.createdAt,
      this.updatedAt,
      this.group});

  ResponseFile.fromJson(dynamic json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    file = json['file'];
    fileName = json['file_name'];
    fileExtension = json['file_extention'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    group = json['group'];
  }

  int? id;
  int? ticketId;
  String? file;
  String? fileName;
  String? fileExtension;
  String? filePath;
  String? createdAt;
  String? updatedAt;
  String? group;

  ResponseFile copyWith({
    int? id,
    int? ticketId,
    String? file,
    String? fileName,
    String? fileExtension,
    String? filePath,
    String? createdAt,
    String? updatedAt,
    String? group,
  }) =>
      ResponseFile(
          id: id ?? this.id,
          ticketId: ticketId ?? this.ticketId,
          file: file ?? this.file,
          fileName: fileName ?? this.fileName,
          fileExtension: fileExtension ?? this.fileExtension,
          filePath: filePath ?? this.filePath,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          group: group ?? this.group);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ticket_id'] = ticketId;
    map['file'] = file;
    map['file_name'] = fileName;
    map['file_extension'] = fileExtension;
    map['file_path'] = filePath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['group'] = group;
    return map;
  }
}

class Execution {
  Execution(
      {this.id, this.ticketId, this.deadline, this.executor, this.executorId});

  Execution.fromJson(dynamic json) {
    id = json['id'];
    ticketId = json['ticket_id'];
    deadline = json['deadline'];
    executor =
        json['executor'] != null ? Executor.fromJson(json['executor']) : null;
    executorId = json['executor_id'];
  }

  int? id;
  int? ticketId;
  String? deadline;
  Executor? executor;
  int? executorId;

  Execution copyWith({
    int? id,
    int? ticketId,
    String? deadline,
    Executor? executor,
    int? executorId,
  }) =>
      Execution(
        id: id ?? this.id,
        ticketId: ticketId ?? this.ticketId,
        deadline: deadline ?? this.deadline,
        executor: executor ?? this.executor,
        executorId: executorId ?? this.executorId,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ticket_id'] = ticketId;
    map['deadline'] = deadline;
    if (executor != null) {
      map['executor'] = executor?.toJson();
    }
    map['executor_id'] = executorId;
    return map;
  }
}

class Executor {
  Executor({this.id, this.firstname, this.lastname});

  Executor.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['first_name'];
    lastname = json['last_name'];
  }

  int? id;
  String? firstname;
  String? lastname;

  Executor copyWith({
    int? id,
    String? firstname,
    String? lastname,
  }) =>
      Executor(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstname;
    map['last_name'] = lastname;
    return map;
  }
}
