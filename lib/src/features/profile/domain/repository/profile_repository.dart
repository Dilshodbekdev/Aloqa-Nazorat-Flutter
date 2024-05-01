import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/data/models/delete_account_model.dart';

abstract class ProfileRepository {
  Future<DataState<LoginModel>> changePassword(ChangePasswordBody body);

  Future<DataState<DeleteAccountModel>> deleteAccount();

  Future<DataState<ResendCodeModel>> uploadPhoto(File file);
}
