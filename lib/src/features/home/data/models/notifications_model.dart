import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';

class NotificationsModel {
  NotificationsModel({this.activeNotificationsCount, this.notifications});

  NotificationsModel.fromJson(dynamic json) {
    activeNotificationsCount = json['active_notifications_count'];
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications?.add(NotificationModel.fromJson(v));
      });
    }
  }

  int? activeNotificationsCount;
  List<NotificationModel>? notifications;

  NotificationsModel copyWith(
          {int? activeNotificationsCount,
          List<NotificationModel>? notifications}) =>
      NotificationsModel(
          activeNotificationsCount:
              activeNotificationsCount ?? this.activeNotificationsCount,
          notifications: notifications ?? this.notifications);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active_notifications_count'] = activeNotificationsCount;
    if (notifications != null) {
      map['notifications'] = notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class NotificationModel {
  NotificationModel({
    this.id,
    this.userId,
    this.ticketId,
    this.extraTicketId,
    this.statusId,
    this.isRead,
    this.createdAt,
    this.updatedAt,
    this.ticket,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    ticketId = json['ticket_id'];
    extraTicketId = json['extra_ticket_id'];
    statusId = json['status_id'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ticket = json['ticket'] != null ? Ticket.fromJson(json['ticket']) : null;
  }

  int? id;
  int? userId;
  int? ticketId;
  int? extraTicketId;
  int? statusId;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  Ticket? ticket;

  NotificationModel copyWith({
    int? id,
    int? userId,
    int? ticketId,
    int? extraTicketId,
    int? statusId,
    bool? isRead,
    String? createdAt,
    String? updatedAt,
    Ticket? ticket,
  }) =>
      NotificationModel(
          id: id ?? this.id,
          userId: userId ?? this.userId,
          ticketId: ticketId ?? this.ticketId,
          extraTicketId: extraTicketId ?? this.extraTicketId,
          statusId: statusId ?? this.statusId,
          isRead: isRead ?? this.isRead,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt,
          ticket: ticket ?? this.ticket);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['ticket_id'] = ticketId;
    map['extra_ticket_id'] = extraTicketId;
    map['status_id'] = statusId;
    map['is_read'] = isRead;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (ticket != null) {
      map['ticket'] = ticket?.toJson();
    }
    return map;
  }
}

class Ticket {
  Ticket({this.id, this.referenceModel});

  Ticket.fromJson(dynamic json) {
    id = json['id'];
    referenceModel = json['reference_parent'] != null
        ? ReferenceModel.fromJson(json['reference_parent'])
        : null;
  }

  int? id;
  ReferenceModel? referenceModel;

  Ticket copyWith({int? id, ReferenceModel? referenceModel}) => Ticket(
      id: id ?? this.id, referenceModel: referenceModel ?? this.referenceModel);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (referenceModel != null) {
      map['reference_parent'] = referenceModel?.toJson();
    }
    return map;
  }
}
