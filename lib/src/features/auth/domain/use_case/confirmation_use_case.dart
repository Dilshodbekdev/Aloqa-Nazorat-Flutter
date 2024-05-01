import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';

class ConfirmationUseCase
    implements UseCase<DataState<LoginModel>, ConfirmationBody> {
  final AuthRepository _repository;

  ConfirmationUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call(
          {required ConfirmationBody params}) async =>
      await _repository.confirmation(params);
}
