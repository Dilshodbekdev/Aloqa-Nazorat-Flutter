part of 'reference_bloc.dart';

class ReferenceState {
  final TicketsModel? ticketsModel;
  final TicketModel? ticketModel;
  final bool isLoginVerified;
  final bool isLoading;
  final bool hasError;
  final bool isExit;
  final String errorMessage;
  final String notificationCount;

  ReferenceState({
    this.ticketsModel,
    this.ticketModel,
    this.isLoginVerified = false,
    this.isLoading = false,
    this.hasError = false,
    this.isExit = false,
    this.errorMessage = 'Some Error',
    this.notificationCount = '',
  });

  ReferenceState copyWith({
    TicketsModel? ticketsModel,
    TicketModel? ticketModel,
    bool? isLoading,
    bool? isLoginVerified,
    bool? hasError,
    bool? isExit,
    String? errorMessage,
    String? notificationCount,
  }) =>
      ReferenceState(
        ticketsModel: ticketsModel ?? this.ticketsModel,
        ticketModel: ticketModel ?? this.ticketModel,
        isLoginVerified: isLoginVerified ?? false,
        isLoading: isLoading ?? false,
        hasError: hasError ?? false,
        isExit: isExit ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
        notificationCount: notificationCount ?? this.notificationCount,
      );
}

