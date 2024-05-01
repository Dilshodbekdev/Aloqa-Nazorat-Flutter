import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/repository/reference_repository.dart';

class TicketsUseCase implements UseCase<DataState<TicketsModel>, int> {
  final ReferenceRepository _repository;

  TicketsUseCase(this._repository);

  @override
  Future<DataState<TicketsModel>> call({required int params}) async =>
      await _repository.tickets();
}
