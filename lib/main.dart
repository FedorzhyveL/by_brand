import 'package:by_brand/core/di.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.I;
Future<void> main() async {
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = injector.get<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
