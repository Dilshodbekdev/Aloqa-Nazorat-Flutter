import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/core/usecase/use_case.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';

class NotificationUseCase implements UseCase<DataState<NotificationsModel>, int> {
  final HomeRepository _repository;

  NotificationUseCase(this._repository);

  @override
  Future<DataState<NotificationsModel>> call({required int params}) async => await _repository.notifications();
}