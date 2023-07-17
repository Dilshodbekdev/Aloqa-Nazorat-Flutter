import 'package:aloqa_nazorat/src/features/auth/data/bodies/login_body.dart';
import 'package:aloqa_nazorat/src/features/auth/data/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: "https://xn.technocorp.uz/")
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
  Future<HttpResponse<String>> register(@Body() String string);

  @POST(_activeProfile)
  Future<HttpResponse<String>> activeProfile(@Body() String string);

  @POST(_resendCode)
  Future<HttpResponse<String>> resendCode(@Body() String string);

  @GET(_oneId)
  Future<HttpResponse<String>> loadDataUser(@Query("code") String code);
}
