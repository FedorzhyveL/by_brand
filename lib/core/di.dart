import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt injector = GetIt.instance;

Future<void> inject() async {
  injector.registerLazySingleton(() {
    return Dio(BaseOptions(baseUrl: 'http://10.0.2.2:8000/api'));
  });

  injector.registerLazySingleton<AppRouter>(() => AppRouter());
}
