import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/base_repository.dart';
import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/data/data_source/profile_api_service.dart';
import 'package:aloqa_nazorat/src/features/profile/data/models/delete_account_model.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl with BaseRepository implements ProfileRepository {
  final ProfileApiService _apiService;

  ProfileRepositoryImpl(this._apiService);

  @override
  Future<DataState<LoginModel>> changePassword(ChangePasswordBody body) async =>
      await handleResponse(response: _apiService.changePassword(body));

  @override
  Future<DataState<DeleteAccountModel>> deleteAccount() async =>
      await handleResponse(response: _apiService.deleteAccount());

  @override
  Future<DataState<ResendCodeModel>> uploadPhoto(File file) async =>
      await handleResponse(response: _apiService.uploadPhoto(file));
}
