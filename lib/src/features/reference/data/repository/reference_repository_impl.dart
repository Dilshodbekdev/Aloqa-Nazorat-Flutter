import 'package:aloqa_nazorat/src/core/resources/base_repository.dart';
import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/reference/data/data_source/reference_api_service.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/repository/reference_repository.dart';

class ReferenceRepositoryImpl
    with BaseRepository
    implements ReferenceRepository {
  final ReferenceApiService _apiService;

  ReferenceRepositoryImpl(this._apiService);

  @override
  Future<DataState<TicketsModel>> tickets() async =>
      await handleResponse(response: _apiService.tickets());

  @override
  Future<DataState<TicketModel>> ticket(String code) async =>
      await handleResponse(response: _apiService.ticket(code));
}
