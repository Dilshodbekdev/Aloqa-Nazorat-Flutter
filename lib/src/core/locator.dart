import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/core/network/api_interceptor.dart';
import 'package:aloqa_nazorat/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:aloqa_nazorat/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/confirmation_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/one_id_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/recover_password_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/regsiter_use_case.dart';
import 'package:aloqa_nazorat/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:aloqa_nazorat/src/features/home/data/data_source/home_api_service.dart';
import 'package:aloqa_nazorat/src/features/home/data/repository/home_repository_impl.dart';
import 'package:aloqa_nazorat/src/features/home/domain/repository/home_repository.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/create_ticket_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/delete_file_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/district_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/notification_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/notifications_delete_all_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/reference_children_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/reference_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/region_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/domain/use_case/upload_file_use_case.dart';
import 'package:aloqa_nazorat/src/features/home/presentation/manager/home_bloc.dart';
import 'package:aloqa_nazorat/src/features/profile/data/data_source/profile_api_service.dart';
import 'package:aloqa_nazorat/src/features/profile/data/repository/profile_repository_impl.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/repository/profile_repository.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/change_password_use_case.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/delete_account_use_case.dart';
import 'package:aloqa_nazorat/src/features/profile/domain/use_case/upload_photo_use_case.dart';
import 'package:aloqa_nazorat/src/features/profile/presentation/manager/profile_bloc.dart';
import 'package:aloqa_nazorat/src/features/reference/data/data_source/reference_api_service.dart';
import 'package:aloqa_nazorat/src/features/reference/data/repository/reference_repository_impl.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/repository/reference_repository.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/ticket_use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/domain/use_case/tickets_use_case.dart';
import 'package:aloqa_nazorat/src/features/reference/presentation/manager/reference_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://murojaat.gis.uz/",
      contentType: "application/json",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible,
    ),
  );
  dio.interceptors.add(ApiInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerFactory(() => AppCubit());

  // Api Services
  locator.registerSingleton(AuthApiService(locator()));
  locator.registerSingleton(HomeApiService(locator()));
  locator.registerSingleton(ReferenceApiService(locator()));
  locator.registerSingleton(ProfileApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));
  locator.registerSingleton<HomeRepository>(HomeRepositoryImpl(locator()));
  locator.registerSingleton<ReferenceRepository>(
      ReferenceRepositoryImpl(locator()));
  locator
      .registerSingleton<ProfileRepository>(ProfileRepositoryImpl(locator()));

  // Auth UseCases
  locator.registerSingleton(LoginUseCase(locator()));
  locator.registerSingleton(RegisterUseCase(locator()));
  locator.registerSingleton(ConfirmationUseCase(locator()));
  locator.registerSingleton(OneIdUseCase(locator()));
  locator.registerSingleton(RecoverPasswordUseCase(locator()));

  // Home UseCases
  locator.registerSingleton(ReferencesUseCase(locator()));
  locator.registerSingleton(NotificationUseCase(locator()));
  locator.registerSingleton(NotificationsDeleteAllUseCase(locator()));
  locator.registerSingleton(ReferenceChildrenUseCase(locator()));
  locator.registerSingleton(RegionsUseCase(locator()));
  locator.registerSingleton(DistrictsUseCase(locator()));
  locator.registerSingleton(UploadFileUseCase(locator()));
  locator.registerSingleton(DeleteFileUseCase(locator()));
  locator.registerSingleton(CreateTicketUseCase(locator()));

  // Reference UseCase
  locator.registerSingleton(TicketsUseCase(locator()));
  locator.registerSingleton(TicketUseCase(locator()));

  // Profile UseCase
  locator.registerSingleton(ChangePasswordUseCase(locator()));
  locator.registerSingleton(UploadPhotoUseCase(locator()));
  locator.registerSingleton(DeleteAccountUseCase(locator()));

  // Blocs
  locator.registerFactory<AuthBloc>(() => AuthBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory<HomeBloc>(() => HomeBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ));
  locator.registerFactory<ReferenceBloc>(
      () => ReferenceBloc(locator(), locator()));
  locator.registerFactory<ProfileBloc>(() => ProfileBloc(locator(), locator(),locator()));
}
