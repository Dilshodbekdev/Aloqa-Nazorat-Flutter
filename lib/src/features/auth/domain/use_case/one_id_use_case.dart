import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/one_id_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';

class OneIdUseCase
    implements UseCase<DataState<LoginModel>, OneIdBody> {
  final AuthRepository _repository;

  OneIdUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call({required OneIdBody params}) async =>
      await _repository.oneId(params);
}
