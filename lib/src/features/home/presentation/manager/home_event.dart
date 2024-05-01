part of 'home_bloc.dart';

abstract class HomeEvent {}

class InitEvent extends HomeEvent {
  InitEvent();
}

class ReferencesEvent extends HomeEvent {
  ReferencesEvent();
}

class ReferenceChildrenEvent extends HomeEvent {
  final int id;

  ReferenceChildrenEvent({required this.id});
}

class RegionsEvent extends HomeEvent {
  RegionsEvent();
}

class DistrictsEvent extends HomeEvent {
  final int id;

  DistrictsEvent({required this.id});
}

class NotificationEvent extends HomeEvent {
  NotificationEvent();
}

class NotificationsDeleteAllEvent extends HomeEvent {
  NotificationsDeleteAllEvent();
}


class UploadFileEvent extends HomeEvent {
  final File file;

  UploadFileEvent({required this.file});
}

class DeleteFileEvent extends HomeEvent {
  final int id;

  DeleteFileEvent({required this.id});
}

class CreateTicketEvent extends HomeEvent {
  final CreateTicketBody body;

  CreateTicketEvent({required this.body});
}

class TicketsEvent extends HomeEvent {
  TicketsEvent();
}

class TicketEvent extends HomeEvent {
  final String code;

  TicketEvent({required this.code});
}
