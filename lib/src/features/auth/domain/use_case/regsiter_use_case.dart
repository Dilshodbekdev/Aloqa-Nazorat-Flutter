import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/register_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase
    implements UseCase<DataState<RegisterModel>, RegisterBody> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<DataState<RegisterModel>> call({required RegisterBody params}) async =>
      await _repository.register(params);
}
