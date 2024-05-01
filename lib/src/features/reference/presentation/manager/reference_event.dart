part of 'reference_bloc.dart';

abstract class ReferenceEvent {}

class TicketsEvent extends ReferenceEvent {
  TicketsEvent();
}

class TicketEvent extends ReferenceEvent {
  final String code;

  TicketEvent({required this.code});
}