import 'package:by_brand/data/api/rest_constants.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

Future<void> inject() async {
  injector.registerLazySingleton(() {
    return Dio(BaseOptions(baseUrl: RestConstants.baseUrl));
  });

  injector.registerLazySingleton<AppRouter>(() => AppRouter());

  injector.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
}
