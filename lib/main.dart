import 'package:by_brand/core/di.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: injector.get<AppRouter>().config(),
      ),
    );
  }
}
