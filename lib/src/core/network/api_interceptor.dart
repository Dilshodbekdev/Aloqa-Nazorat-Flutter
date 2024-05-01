import 'package:aloqa_nazorat/src/core/services/services.dart';
import 'package:aloqa_nazorat/src/core/util/app_constants.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await Prefs.getString(AppConstants.kToken) ?? "";
    if (token.isNotEmpty) {
      options.headers["Authorization"] =
          'Bearer $token';
    }
    options.headers["mobile-app-key"] ="mobile_key";
        //'xnazorat-3a63daeb0f10ed0f104cc9a2406c9988-mobile';

    LogService.request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      //rootNavigator.currentContext?.goNamed(AppRoutes.register.name);
    }
    LogService.errorResponse(err);
    super.onError(err, handler);
  }
}
