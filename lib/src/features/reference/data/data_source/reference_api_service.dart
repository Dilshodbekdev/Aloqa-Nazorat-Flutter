import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'reference_api_service.g.dart';

@RestApi()
abstract class ReferenceApiService {
  factory ReferenceApiService(Dio dio, {String baseUrl}) = _ReferenceApiService;

  /// URLS
  static const String _tickets = 'api/my-tickets';
  static const String _ticket = 'api/my-ticket/{code}';

  /// REQUESTS
  @GET(_tickets)
  Future<HttpResponse<TicketsModel>> tickets();

  @GET(_ticket)
  Future<HttpResponse<TicketModel>> ticket(
    @Path('code') String code,
  );
}
