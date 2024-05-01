import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';

abstract class ReferenceRepository {
  Future<DataState<TicketsModel>> tickets();

  Future<DataState<TicketModel>> ticket(String code);
}
