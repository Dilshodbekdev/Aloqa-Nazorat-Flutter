import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/create_ticket_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class CreateTicketUseCase
    implements UseCase<DataState<CreateTicketModel>, CreateTicketBody> {
  final HomeRepository _repository;

  CreateTicketUseCase(this._repository);

  @override
  Future<DataState<CreateTicketModel>> call(
          {required CreateTicketBody params}) async =>
      await _repository.createTicket(params);
}
