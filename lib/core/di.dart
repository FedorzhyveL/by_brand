import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:by_brand/data/api/rest_client.dart';
import 'package:by_brand/data/api/rest_constants.dart';
import 'package:by_brand/data/repositories_impl/categories_repository_impl.dart';
import 'package:by_brand/domain/repositories/categories_repository.dart';
import 'package:by_brand/domain/use_cases/get_categories_use_case.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';

final GetIt injector = GetIt.instance;

void inject() {
  final dio = Dio(
    BaseOptions(
      baseUrl: RestConstants.baseUrl,
      connectTimeout: Duration(minutes: 1),
    ),
  );
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
    ),
  );
  injector.registerSingleton(RestClient(dio));

  injector.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  injector.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );

  injectRepositories();

  injectUseCases();
}

void injectRepositories() {
  injector.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(
      restClient: injector.get<RestClient>(),
    ),
  );
}

void injectUseCases() {
  injector.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(
      categoriesRepository: injector.get<CategoriesRepository>(),
    ),
  );
}
