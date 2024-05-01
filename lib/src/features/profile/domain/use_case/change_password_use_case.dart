import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/repository/profile_repository.dart';

class ChangePasswordUseCase
    implements UseCase<DataState<LoginModel>, ChangePasswordBody> {
  final ProfileRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call(
          {required ChangePasswordBody params}) async =>
      await _repository.changePassword(params);
}
