import 'dart:developer';
import 'dart:io';

import 'package:retrofit/retrofit.dart' as retrofit;
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import '../../../generated/l10n.dart';
import '../services/services.dart';
import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T>> handleResponse<T>(
      {required Future<retrofit.HttpResponse<T>> response, T Function(T param)? next}) async {
    //final context = rootNavigator.currentContext;
    try {
      final httpResponse = await response;

      LogService.request(httpResponse);
      return DataSuccess(next == null ? httpResponse.data : next((httpResponse.data)));
    } on DioError catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        final message = "S.of(context!).badInternetConnection";
        log(message);
        return DataFailed(message: message);
      } else if (e.isBadRequest) {
        final message = e.response?.data?['message'];

        LogService.errorResponse(e);
        return DataFailed(message: message);
      } else {
        final message = "S.of(context!).appError";
        log(message);

        LogService.errorResponse(e);

        return DataFailed(message: message);
      }
    }
  }
}

extension DioErrorX on DioError {
  bool get isBadConnection => type == DioErrorType.connectionTimeout;

  bool get isNoConnection => type == DioErrorType.unknown && error is SocketException;

  bool get isBadRequest => (400 <= (response?.statusCode ?? 499) && (response?.statusCode ?? 499) < 500);
}

extension ResponceX on Response {
  bool get isSuccessful => (200 <= (statusCode ?? 499) && (statusCode ?? 499) < 300);
}