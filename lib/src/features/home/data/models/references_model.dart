import 'package:aloqa_nazorat/src/features/reference/data/models/name.dart';

class ReferenceModel {
  ReferenceModel({
    this.id,
    this.name,
    this.parentId,
    this.isActive,
    this.sort,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  ReferenceModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    parentId = json['parent_id'];
    isActive = json['is_active'];
    sort = json['sort'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  Name? name;
  int? parentId;
  bool? isActive;
  int? sort;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  ReferenceModel copyWith({
    int? id,
    Name? name,
    int? parentId,
    bool? isActive,
    int? sort,
    String? deletedAt,
    String? createdAt,
    String? updatedAt,
  }) =>
      ReferenceModel(
        id: id ?? this.id,
        name: name ?? this.name,
        parentId: parentId ?? this.parentId,
        isActive: isActive ?? this.isActive,
        sort: sort ?? this.sort,
        deletedAt: deletedAt ?? this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['parent_id'] = parentId;
    map['is_active'] = isActive;
    map['sort'] = sort;
    map['deleted_at'] = deletedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}