import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/regions_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class DistrictsUseCase
    implements UseCase<DataState<List<RegionsModel>>, int> {
  final HomeRepository _repository;

  DistrictsUseCase(this._repository);

  @override
  Future<DataState<List<RegionsModel>>> call({required int params}) async =>
      await _repository.districts(params);
}
