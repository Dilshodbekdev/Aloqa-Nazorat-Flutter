import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/repository/profile_repository.dart';

class UploadPhotoUseCase implements UseCase<DataState<ResendCodeModel>, File> {
  final ProfileRepository _repository;

  UploadPhotoUseCase(this._repository);

  @override
  Future<DataState<ResendCodeModel>> call({required File params}) async => await _repository.uploadPhoto(params);
}