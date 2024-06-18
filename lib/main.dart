import 'package:by_brand/core/di.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
