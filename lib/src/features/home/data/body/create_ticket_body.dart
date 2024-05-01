class CreateTicketBody {
  CreateTicketBody({
    this.address,
    this.description,
    this.files,
    this.firstName,
    this.lastName,
    this.letterId,
    this.phone,
    this.referenceId,
    this.referenceParentId,
    this.ticketDistrictId,
    this.ticketRegionId,
    this.midName,
  });

  CreateTicketBody.fromJson(dynamic json) {
    address = json['address'];
    description = json['description'];
    files = json['files'] != null ? json['files'].cast<int>() : [];
    firstName = json['first_name'];
    lastName = json['last_name'];
    letterId = json['letter_id'];
    phone = json['phone'];
    referenceId = json['reference_id'];
    referenceParentId = json['reference_parent_id'];
    ticketDistrictId = json['ticket_district_id'];
    ticketRegionId = json['ticket_region_id'];
    midName = json['mid_name'];
  }

  String? address;
  String? description;
  List<int>? files;
  String? firstName;
  String? lastName;
  int? letterId;
  String? phone;
  int? referenceId;
  int? referenceParentId;
  int? ticketDistrictId;
  int? ticketRegionId;
  String? midName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['description'] = description;
    map['files'] = files;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['letter_id'] = letterId;
    map['phone'] = phone;
    map['reference_id'] = referenceId;
    map['reference_parent_id'] = referenceParentId;
    map['ticket_district_id'] = ticketDistrictId;
    map['ticket_region_id'] = ticketRegionId;
    map['mid_name'] = midName;
    return map;
  }
}
