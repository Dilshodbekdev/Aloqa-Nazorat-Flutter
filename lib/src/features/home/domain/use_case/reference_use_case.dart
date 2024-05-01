import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class ReferencesUseCase implements UseCase<DataState<List<ReferenceModel>>, int> {
  final HomeRepository _repository;

  ReferencesUseCase(this._repository);

  @override
  Future<DataState<List<ReferenceModel>>> call({required int params}) async => await _repository.references();
}