part of 'home_bloc.dart';

class HomeState {
  final List<ReferenceModel>? references;
  final List<ReferenceModel>? referenceChildren;
  final NotificationsModel? notificationsModel;
  final NotificationsDeleteAllModel? notificationsDeleteAllModel;
  final UploadFileModel? uploadFileModel;
  final List<RegionsModel>? regions;
  final List<RegionsModel>? districts;
  final TicketsModel? ticketsModel;
  final TicketModel? ticketModel;
  final List<Data?>? files;
  final bool isLoginVerified;
  final bool isLoading;
  final bool isUploadFileLoading;
  final bool isUploadFileVerified;
  final bool isProblemsLoaded;
  final bool hasError;
  final bool isExit;
  final String errorMessage;
  final int notificationCount;
  final int sendReferenceCount;
  final int responseReferenceCount;
  final int allReferenceCount;

  HomeState({
    this.references = const [],
    this.regions = const [],
    this.districts = const [],
    this.ticketsModel,
    this.ticketModel,
    this.files = const [],
    this.referenceChildren = const [],
    this.notificationsModel,
    this.notificationsDeleteAllModel,
    this.uploadFileModel,
    this.isLoginVerified = false,
    this.isLoading = false,
    this.isUploadFileLoading = false,
    this.isUploadFileVerified = false,
    this.isProblemsLoaded = false,
    this.hasError = false,
    this.isExit = false,
    this.errorMessage = 'Some Error',
    this.notificationCount = 0,
    this.sendReferenceCount = 0,
    this.responseReferenceCount = 0,
    this.allReferenceCount = 0,
  });

  HomeState copyWith({
    List<ReferenceModel>? references,
    List<ReferenceModel>? referenceChildren,
    List<RegionsModel>? regions,
    List<RegionsModel>? districts,
    TicketsModel? ticketsModel,
    TicketModel? ticketModel,
    List<Data?>? files,
    NotificationsModel? notificationsModel,
    NotificationsDeleteAllModel? notificationsDeleteAllModel,
    UploadFileModel? uploadFileModel,
    bool? isLoading,
    bool? isUploadFileLoading,
    bool? isLoginVerified,
    bool? isUploadFileVerified,
    bool? isProblemsLoaded,
    bool? hasError,
    bool? isExit,
    String? errorMessage,
    int? notificationCount,
    int? sendReferenceCount,
    int? responseReferenceCount,
    int? allReferenceCount,
  }) =>
      HomeState(
        references: references ?? this.references,
        referenceChildren: referenceChildren ?? this.referenceChildren,
        regions: regions ?? this.regions,
        districts: districts ?? [],
        ticketsModel: ticketsModel ?? this.ticketsModel,
        ticketModel: ticketModel ?? this.ticketModel,
        files: files ?? this.files,
        notificationsModel: notificationsModel ?? this.notificationsModel,
        notificationsDeleteAllModel:
            notificationsDeleteAllModel ?? this.notificationsDeleteAllModel,
        uploadFileModel: uploadFileModel ?? this.uploadFileModel,
        isLoginVerified: isLoginVerified ?? false,
        isLoading: isLoading ?? false,
        isUploadFileLoading: isUploadFileLoading ?? false,
        isUploadFileVerified: isUploadFileVerified ?? false,
        isProblemsLoaded: isProblemsLoaded ?? false,
        hasError: hasError ?? false,
        isExit: isExit ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
        notificationCount: notificationCount ?? this.notificationCount,
        sendReferenceCount: sendReferenceCount ?? this.sendReferenceCount,
        responseReferenceCount:
            responseReferenceCount ?? this.responseReferenceCount,
        allReferenceCount: allReferenceCount ?? this.allReferenceCount,
      );
}
