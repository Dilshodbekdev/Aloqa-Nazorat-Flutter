import 'dart:async';
import 'dart:io';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/home/data/body/create_ticket_body.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_delete_all_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/notifications_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/references_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/regions_model.dart';
import 'package:aloqa_nazorat/src/features/home/data/models/upload_file_model.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/create_ticket_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/delete_file_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/district_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/notification_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/notifications_delete_all_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/reference_children_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/reference_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/region_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/upload_file_use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/ticket_use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/tickets_use_case.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ReferencesUseCase _referencesUseCase;
  final NotificationUseCase _notificationUseCase;
  final NotificationsDeleteAllUseCase _notificationsDeleteAllUseCase;
  final ReferenceChildrenUseCase _referenceChildrenUseCase;
  final RegionsUseCase _regionsUseCase;
  final DistrictsUseCase _districtsUseCase;
  final UploadFileUseCase _uploadFileUseCase;
  final DeleteFileUseCase _deleteFileUseCase;
  final CreateTicketUseCase _createTicketUseCase;
  final TicketsUseCase _ticketsUseCase;
  final TicketUseCase _ticketUseCase;

  HomeBloc(
    this._referencesUseCase,
    this._notificationUseCase,
    this._referenceChildrenUseCase,
    this._regionsUseCase,
    this._districtsUseCase,
    this._uploadFileUseCase,
    this._deleteFileUseCase,
    this._createTicketUseCase,
    this._ticketsUseCase,
    this._ticketUseCase,
    this._notificationsDeleteAllUseCase,
  ) : super(HomeState()) {
    on<ReferencesEvent>((event, emit) async {
      await emit.onEach(_onReferences(event), onData: emit);
    });

    on<ReferenceChildrenEvent>((event, emit) async {
      await emit.onEach(_onReferenceChildren(event), onData: emit);
    });

    on<NotificationEvent>((event, emit) async {
      await emit.onEach(_onNotification(event), onData: emit);
    });

    on<NotificationsDeleteAllEvent>((event, emit) async {
      await emit.onEach(_onNotificationsDeleteAll(event), onData: emit);
    });

    on<InitEvent>((event, emit) async {
      await emit.onEach(_onInit(event), onData: emit);
    });

    on<RegionsEvent>((event, emit) async {
      await emit.onEach(_onRegions(event), onData: emit);
    });

    on<DistrictsEvent>((event, emit) async {
      await emit.onEach(_onDistricts(event), onData: emit);
    });

    on<UploadFileEvent>((event, emit) async {
      await emit.onEach(_onUploadFile(event), onData: emit);
    });

    on<CreateTicketEvent>((event, emit) async {
      await emit.onEach(_onCreateTicket(event), onData: emit);
    });

    on<TicketsEvent>((event, emit) async {
      await emit.onEach(_onTickets(event), onData: emit);
    });

    on<TicketEvent>((event, emit) async {
      await emit.onEach(_onTicket(event), onData: emit);
    });
  }

  getReferences() {
    add(ReferencesEvent());
  }

  getReferenceChildren(int id) {
    add(ReferenceChildrenEvent(id: id));
  }

  getNotifications() {
    add(NotificationEvent());
  }

  notificationsDeleteAll() {
    add(NotificationsDeleteAllEvent());
  }

  init() {
    add(InitEvent());
  }

  regions() {
    add(RegionsEvent());
  }

  districts(int id) {
    add(DistrictsEvent(id: id));
  }

  uploadFile(File file) {
    add(UploadFileEvent(file: file));
  }

  createTicket(CreateTicketBody body) {
    add(CreateTicketEvent(body: body));
  }

  tickets() {
    add(TicketsEvent());
  }

  ticket(String code) {
    add(TicketEvent(code: code));
  }

  Stream<HomeState> _onInit(InitEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState1 = await _referencesUseCase.call(params: 1);
    final dataState2 = await _notificationUseCase.call(params: 1);
    final dataState3 = await _ticketsUseCase.call(params: 1);

    if (dataState1 is DataSuccess) {
      yield state.copyWith(references: dataState1.data);
    } else if (dataState1 is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState1.message);
    }

    if (dataState2 is DataSuccess) {
      yield state.copyWith(
        notificationCount: dataState2.data?.activeNotificationsCount,
        notificationsModel: dataState2.data,
        isExit:
            dataState2.data?.activeNotificationsCount != null ? false : true,
      );
    } else if (dataState2 is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState2.message);
    }

    if (dataState3 is DataSuccess) {
      yield state.copyWith(
        ticketsModel: dataState3.data,
        sendReferenceCount: dataState3.data?.data
            ?.where((element) => element.status != '1' && element.status != '5')
            .toList()
            .length,
        allReferenceCount: dataState3.data?.data?.length,
        responseReferenceCount: dataState3.data?.data
            ?.where((element) => element.status == '5')
            .toList()
            .length,
      );
    } else if (dataState3 is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState3.message);
    }
  }

  Stream<HomeState> _onReferences(ReferencesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _referencesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          references: dataState.data, isLoginVerified: true, isLoading: false);
    } else if (dataState is DataFailed) {
      yield state.copyWith(
          hasError: true, errorMessage: dataState.message, isLoading: false);
    }
  }

  Stream<HomeState> _onRegions(RegionsEvent event) async* {
    yield state.copyWith(
      isLoading: true,
    );

    final dataState = await _regionsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        regions: dataState.data,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onDistricts(DistrictsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _districtsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(districts: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onReferenceChildren(ReferenceChildrenEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _referenceChildrenUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          referenceChildren: dataState.data, isProblemsLoaded: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onNotification(NotificationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _notificationUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          isLoading: false,
          notificationsModel: dataState.data,
          isLoginVerified: true,
          notificationCount: dataState.data?.activeNotificationsCount);
    } else if (dataState is DataFailed) {
      yield state.copyWith(
          hasError: true, errorMessage: dataState.message, isLoading: false);
    }
  }

  Stream<HomeState> _onNotificationsDeleteAll(
      NotificationsDeleteAllEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _notificationsDeleteAllUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isLoading: false,
        notificationsDeleteAllModel: dataState.data,
        isLoginVerified: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(
          hasError: true, errorMessage: dataState.message, isLoading: false);
    }
  }

  Stream<HomeState> _onUploadFile(UploadFileEvent event) async* {
    yield state.copyWith(isUploadFileLoading: true);

    final dataState = await _uploadFileUseCase.call(params: event.file);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        uploadFileModel: dataState.data,
        isUploadFileVerified: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(
        hasError: true,
        errorMessage: dataState.message,
      );
    }
  }

  Stream<HomeState> _onCreateTicket(CreateTicketEvent event) async* {
    yield state.copyWith(isLoading: true, districts: []);

    final dataState = await _createTicketUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isLoginVerified: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(
        hasError: true,
        errorMessage: dataState.message,
      );
    }
  }

  Stream<HomeState> _onTickets(TicketsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _ticketsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isLoading: false,
        ticketsModel: dataState.data,
        isLoginVerified: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(
          hasError: true, errorMessage: dataState.message, isLoading: false);
    }
  }

  Stream<HomeState> _onTicket(TicketEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _ticketUseCase.call(params: event.code);

    if (dataState is DataSuccess) {
      yield state.copyWith(
        isLoading: false,
        ticketModel: dataState.data,
        isLoginVerified: true,
      );
    } else if (dataState is DataFailed) {
      yield state.copyWith(
          hasError: true, errorMessage: dataState.message, isLoading: false);
    }
  }
}
