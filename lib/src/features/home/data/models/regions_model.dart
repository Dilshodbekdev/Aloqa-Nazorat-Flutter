import 'package:aloqa_nazorat/src/features/reference/data/models/name.dart';

class RegionsModel {
  RegionsModel({
    this.id,
    this.name,
    this.isActive,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.isRepublic,
    this.uzTextLetter,
    this.enTextLetter,
    this.uzAddressLetter,
    this.enAddressLetter,
  });

  RegionsModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isActive = json['is_active'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isRepublic = json['is_republic'];
    uzTextLetter = json['uz_text_letter'];
    enTextLetter = json['en_text_letter'];
    uzAddressLetter = json['uz_address_letter'];
    enAddressLetter = json['en_address_letter'];
  }

  int? id;
  Name? name;
  bool? isActive;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  bool? isRepublic;
  String? uzTextLetter;
  String? enTextLetter;
  String? uzAddressLetter;
  String? enAddressLetter;

  RegionsModel copyWith({
    int? id,
    Name? name,
    bool? isActive,
    int? parentId,
    String? createdAt,
    String? updatedAt,
    bool? isRepublic,
    String? uzTextLetter,
    String? enTextLetter,
    String? uzAddressLetter,
    String? enAddressLetter,
  }) =>
      RegionsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        parentId: parentId ?? this.parentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isRepublic: isRepublic ?? this.isRepublic,
        uzTextLetter: uzTextLetter ?? this.uzTextLetter,
        enTextLetter: enTextLetter ?? this.enTextLetter,
        uzAddressLetter: uzAddressLetter ?? this.uzAddressLetter,
        enAddressLetter: enAddressLetter ?? this.enAddressLetter,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['is_active'] = isActive;
    map['parent_id'] = parentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_republic'] = isRepublic;
    map['uz_text_letter'] = uzTextLetter;
    map['en_text_letter'] = enTextLetter;
    map['uz_address_letter'] = uzAddressLetter;
    map['en_address_letter'] = enAddressLetter;
    return map;
  }
}
