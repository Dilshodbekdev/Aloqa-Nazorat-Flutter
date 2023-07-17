part of 'services.dart';

class LogService {
  static final Logger _logger = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(
      methodCount: 0,
    ),
  );

  static void d(String? message) {
    _logger.d(message);
  }

  static void i(String? message) {
    _logger.i(message);
  }

  static void w(String? message) {
    _logger.w(message);
  }

  static void e(String? message) {
    _logger.e(message);
  }

  static void request(HttpResponse request) {
    if (request.response.isSuccessful) {
      _logger.i('REQUEST: ${request.response.requestOptions.method} ${request.response.realUri};\n'
          'RESPONSE: ${request.response.statusCode} ${request.response.statusMessage}\nDATA = ${request.response.data}');
    }
  }

  static void errorResponse(DioError error) {
    _logger.e('REQUEST: ${error.requestOptions.method} ${error.response?.realUri}\n'
        'RESPONSE: ${error.response?.statusCode} ${error.response?.statusMessage}\nMESSAGE = ${error.response?.data?['message']}');
  }
}