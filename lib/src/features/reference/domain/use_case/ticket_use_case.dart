import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/repository/reference_repository.dart';

class TicketUseCase implements UseCase<DataState<TicketModel>, String> {
  final ReferenceRepository _repository;

  TicketUseCase(this._repository);

  @override
  Future<DataState<TicketModel>> call({required String params}) async =>
      await _repository.ticket(params);
}
