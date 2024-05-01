import 'dart:async';

import 'package:aloqa_nazorat/src/core/resources/data_state.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/ticket_model.dart';
import 'package:aloqa_nazorat/src/features/reference/data/models/tickets_model.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/ticket_use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/tickets_use_case.dart';
import 'package:bloc/bloc.dart';

part 'reference_event.dart';

part 'reference_state.dart';

class ReferenceBloc extends Bloc<ReferenceEvent, ReferenceState> {
  final TicketsUseCase _ticketsUseCase;
  final TicketUseCase _ticketUseCase;

  ReferenceBloc(this._ticketsUseCase, this._ticketUseCase)
      : super(ReferenceState()) {
    on<TicketsEvent>((event, emit) async {
      await emit.onEach(_onTickets(event), onData: emit);
    });

    on<TicketEvent>((event, emit) async {
      await emit.onEach(_onTicket(event), onData: emit);
    });
  }

  tickets() {
    add(TicketsEvent());
  }

  ticket(String code) {
    add(TicketEvent(code: code));
  }

  Stream<ReferenceState> _onTickets(TicketsEvent event) async* {
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

  Stream<ReferenceState> _onTicket(TicketEvent event) async* {
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
