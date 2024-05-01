import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/base_repository.dart';
import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/data_source/home_api_service.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/create_ticket_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/delete_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_delete_all_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/regions_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final HomeApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ReferenceModel>>> references() async =>
      await handleResponse(response: _apiService.references());

  @override
  Future<DataState<NotificationsModel>> notifications() async =>
      await handleResponse(response: _apiService.notifications());

  @override
  Future<DataState<NotificationsDeleteAllModel>>
      notificationsDeleteAll() async =>
          await handleResponse(response: _apiService.notificationsDeleteAll());

  @override
  Future<DataState<List<ReferenceModel>>> referenceChildren(int id) async =>
      await handleResponse(response: _apiService.referenceChildren(id));

  @override
  Future<DataState<List<RegionsModel>>> regions() async =>
      await handleResponse(response: _apiService.regions());

  @override
  Future<DataState<List<RegionsModel>>> districts(int id) async =>
      await handleResponse(response: _apiService.districts(id));

  @override
  Future<DataState<UploadFileModel>> uploadFile(File file) async =>
      await handleResponse(response: _apiService.uploadFile(file));

  @override
  Future<DataState<DeleteFileModel>> deleteFile(int id) async =>
      await handleResponse(response: _apiService.deleteFile(id));

  @override
  Future<DataState<CreateTicketModel>> createTicket(
          CreateTicketBody body) async =>
      await handleResponse(response: _apiService.createTicket(body));
}
