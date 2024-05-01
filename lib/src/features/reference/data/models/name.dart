class Name {
  Name({
    this.oz,
    this.uz,
    this.ru,
  });

  Name.fromJson(dynamic json) {
    oz = json['oz'];
    uz = json['uz'];
    ru = json['ru'];
  }

  String? oz;
  String? uz;
  String? ru;

  Name copyWith({
    String? oz,
    String? uz,
    String? ru,
  }) =>
      Name(
        oz: oz ?? this.oz,
        uz: uz ?? this.uz,
        ru: ru ?? this.ru,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oz'] = oz;
    map['uz'] = uz;
    map['ru'] = ru;
    return map;
  }
}