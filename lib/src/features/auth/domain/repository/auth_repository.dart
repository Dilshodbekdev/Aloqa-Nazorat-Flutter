import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/one_id_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/resend_code_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/password_restore_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/register_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';

abstract class AuthRepository {
  Future<DataState<LoginModel>> login(LoginBody body);

  Future<DataState<RegisterModel>> register(RegisterBody body);

  Future<DataState<LoginModel>> confirmation(ConfirmationBody body);

  Future<DataState<ResendCodeModel>> resendCode(ResendCodeBody body);

  Future<DataState<PasswordRestoreModel>> recoverPassword(RecoverPasswordBody body);

  Future<DataState<LoginModel>> oneId(OneIdBody body);
}
