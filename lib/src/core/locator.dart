import 'package:aloqa_nazorat/src/core/app_state/cubit/app_cubit.dart';
import 'package:aloqa_nazorat/src/features/auth/data/data_source/auth_api_service.dart';
import 'package:aloqa_nazorat/src/features/auth/data/repository/auth_repository_impl.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/repository/auth_repository.dart';
import 'package:aloqa_nazorat/src/features/auth/domain/use_case/login_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<Dio>(Dio(BaseOptions(
      baseUrl: "https://xn.technocorp.uz",
      contentType: "",
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60 * 1000),
      receiveTimeout: const Duration(seconds: 60 * 1000),
      listFormat: ListFormat.multiCompatible)));

  locator.registerFactory(() => AppCubit());

  // Api Services
  locator.registerSingleton(AuthApiService(locator()));

  // Repositories
  locator.registerSingleton<AuthRepository>(AuthRepositoryImpl(locator()));

  // UseCases
  locator.registerSingleton(LoginUseCase(locator()));
}
