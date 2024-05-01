import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class UploadFileUseCase implements UseCase<DataState<UploadFileModel>, File> {
  final HomeRepository _repository;

  UploadFileUseCase(this._repository);

  @override
  Future<DataState<UploadFileModel>> call({required File params}) async => await _repository.uploadFile(params);
}