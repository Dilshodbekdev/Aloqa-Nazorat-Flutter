import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/data/models/delete_account_model.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/repository/profile_repository.dart';

class DeleteAccountUseCase
    implements UseCase<DataState<DeleteAccountModel>, int> {
  final ProfileRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<DataState<DeleteAccountModel>> call({required int params}) async =>
      await _repository.deleteAccount();
}
