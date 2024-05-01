import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/delete_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class DeleteFileUseCase implements UseCase<DataState<DeleteFileModel>, int> {
  final HomeRepository _repository;

  DeleteFileUseCase(this._repository);

  @override
  Future<DataState<DeleteFileModel>> call({required int params}) async =>
      await _repository.deleteFile(params);
}
