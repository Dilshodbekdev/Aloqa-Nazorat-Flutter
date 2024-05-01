import 'dart:io';

import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/create_ticket_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/delete_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_delete_all_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/regions_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  /// URLS
  static const String _references = 'api/references';
  static const String _notifications = 'api/notifications';
  static const String _notificationsDeleteAll = 'api/notifications/delete-all';
  static const String _referenceChildren = 'api/references/{id}/children';
  static const String _regions = 'api/regions';
  static const String _districts = 'api/region/{id}/districts';
  static const String _uploadFile = 'api/file-upload';
  static const String _deleteFile = 'pi/file-delete/{id}';
  static const String _createTicket = 'api/create-ticket';

  /// REQUESTS
  @GET(_references)
  Future<HttpResponse<List<ReferenceModel>>> references();

  @GET(_referenceChildren)
  Future<HttpResponse<List<ReferenceModel>>> referenceChildren(
      @Path('id') int id);

  @GET(_notifications)
  Future<HttpResponse<NotificationsModel>> notifications();

  @POST(_notificationsDeleteAll)
  Future<HttpResponse<NotificationsDeleteAllModel>> notificationsDeleteAll();

  @GET(_regions)
  Future<HttpResponse<List<RegionsModel>>> regions();

  @GET(_districts)
  Future<HttpResponse<List<RegionsModel>>> districts(@Path('id') int id);

  @POST(_uploadFile)
  @MultiPart()
  Future<HttpResponse<UploadFileModel>> uploadFile(@Part() File file);

  @DELETE(_deleteFile)
  Future<HttpResponse<DeleteFileModel>> deleteFile(@Path('id') int id);

  @POST(_createTicket)
  Future<HttpResponse<CreateTicketModel>> createTicket(
      @Body() CreateTicketBody body);
}
