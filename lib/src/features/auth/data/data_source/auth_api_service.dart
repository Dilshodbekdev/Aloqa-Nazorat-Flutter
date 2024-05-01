import 'package:aloqa_nazorat/src/features/auth/data/bodies/confirmation_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/recover_password_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/register_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/bodies/resend_code_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/password_restore_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/register_model.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/resend_code_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// URLS
  static const String _login = 'api/login';
  static const String _register = 'api/register';
  static const String _oneId = 'api/one-id/432fdsfHHDSFG213__LL-123QWE';
  static const String _activeProfile = 'api/activate-profile';
  static const String _resendCode = 'api/resend-code';
  static const String _passwordRestore = 'api/password-restore';

  /// REQUESTS
  @POST(_login)
  Future<HttpResponse<LoginModel>> login(@Body() LoginBody body);

  @POST(_register)
  Future<HttpResponse<RegisterModel>> register(@Body() RegisterBody body);

  @POST(_activeProfile)
  Future<HttpResponse<LoginModel>> activeProfile(@Body() ConfirmationBody body);

  @POST(_resendCode)
  Future<HttpResponse<ResendCodeModel>> resendCode(@Body() ResendCodeBody body);

  @POST(_passwordRestore)
  Future<HttpResponse<PasswordRestoreModel>> passwordRestore(
      @Body() RecoverPasswordBody body);

  @GET(_oneId)
  Future<HttpResponse<LoginModel>> loadDataUser(
      @Query("code") String code, @Query("device_key") String deviceKey);
}
