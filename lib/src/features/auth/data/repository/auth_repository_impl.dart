import 'package:aloqa_nazorat/src/core/resources/base_repository.dart';
import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/one_id_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/resend_code_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/password_restore_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/register_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl with BaseRepository implements AuthRepository {
  final AuthApiService _apiService;

  AuthRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginModel>> login(LoginBody body) async =>
      await handleResponse(response: _apiService.login(body));

  @override
  Future<DataState<RegisterModel>> register(RegisterBody body) async =>
      await handleResponse(response: _apiService.register(body));

  @override
  Future<DataState<LoginModel>> confirmation(ConfirmationBody body) async =>
      await handleResponse(response: _apiService.activeProfile(body));

  @override
  Future<DataState<ResendCodeModel>> resendCode(ResendCodeBody body) async =>
      await handleResponse(response: _apiService.resendCode(body));

  @override
  Future<DataState<PasswordRestoreModel>> recoverPassword(
          RecoverPasswordBody body) async =>
      await handleResponse(response: _apiService.passwordRestore(body));

  @override
  Future<DataState<LoginModel>> oneId(
          OneIdBody body) async =>
      await handleResponse(
          response:
              _apiService.loadDataUser(body.code ?? "", body.deviceKey ?? ""));
}
