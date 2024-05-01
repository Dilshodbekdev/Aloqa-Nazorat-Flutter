import 'dart:io';

import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:aloqa_nazorat/src/features/profile/data/body/change_password_body.dart';
import 'package:aloqa_nazorat/src/features/profile/data/models/delete_account_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'profile_api_service.g.dart';

@RestApi()
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  /// URLS
  static const String _changePassword = 'api/profile-update';
  static const String _uploadPhoto = 'api/user-photo';
  static const String _deleteAccount = 'api/user/destroy';

  /// REQUESTS
  @POST(_changePassword)
  Future<HttpResponse<LoginModel>> changePassword(
      @Body() ChangePasswordBody body);

  @POST(_deleteAccount)
  Future<HttpResponse<DeleteAccountModel>> deleteAccount();

  @POST(_uploadPhoto)
  @MultiPart()
  Future<HttpResponse<ResendCodeModel>> uploadPhoto(@Part() File file);
}
