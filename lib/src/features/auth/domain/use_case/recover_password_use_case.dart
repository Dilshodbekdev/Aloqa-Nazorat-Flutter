import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/password_restore_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';

class RecoverPasswordUseCase
    implements UseCase<DataState<PasswordRestoreModel>, RecoverPasswordBody> {
  final AuthRepository _repository;

  RecoverPasswordUseCase(this._repository);

  @override
  Future<DataState<PasswordRestoreModel>> call(
          {required RecoverPasswordBody params}) async =>
      await _repository.recoverPassword(params);
}
