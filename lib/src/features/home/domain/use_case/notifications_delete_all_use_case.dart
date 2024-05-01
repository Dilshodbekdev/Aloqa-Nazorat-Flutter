import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_delete_all_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class NotificationsDeleteAllUseCase
    implements UseCase<DataState<NotificationsDeleteAllModel>, int> {
  final HomeRepository _repository;

  NotificationsDeleteAllUseCase(this._repository);

  @override
  Future<DataState<NotificationsDeleteAllModel>> call(
          {required int params}) async =>
      await _repository.notificationsDeleteAll();
}
