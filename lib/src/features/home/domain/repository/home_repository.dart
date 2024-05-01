import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/create_ticket_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/delete_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_delete_all_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/regions_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';

abstract class HomeRepository {
  Future<DataState<List<ReferenceModel>>> references();

  Future<DataState<List<ReferenceModel>>> referenceChildren(int id);

  Future<DataState<NotificationsModel>> notifications();

  Future<DataState<NotificationsDeleteAllModel>> notificationsDeleteAll();

  Future<DataState<List<RegionsModel>>> regions();

  Future<DataState<List<RegionsModel>>> districts(int id);

  Future<DataState<UploadFileModel>> uploadFile(File file);

  Future<DataState<DeleteFileModel>> deleteFile(int id);

  Future<DataState<CreateTicketModel>> createTicket(CreateTicketBody body);
}
