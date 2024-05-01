import 'package:aloqa_nazorat/src/core/error/dio_error.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:dio/dio.dart';
import 'data_state.dart';

mixin BaseRepository {
  Future<DataState<T>> handleResponse<T>(
      {required Future<retrofit.HttpResponse<T>> response, T Function(T param)? next}) async {
    try {
      final httpResponse = await response;
      return DataSuccess(next == null ? httpResponse.data : next((httpResponse.data)));
    } on DioError catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        final message = 'Internet bilan aloqa yaxshi emas!';
        return DataFailed(message: message);
      } else if (e.isBadRequest) {
        final message = e.response?.data?['message'] ?? 'Bad request';
        return DataFailed(message: message);
      } else {
        final message = 'Xatolik yuz berdi!';
        return DataFailed(message: message);
      }
    }
  }
}
