import 'package:by_brand/main.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

class NotAuthorized extends StatelessWidget {
  const NotAuthorized({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () => injector.get<AppRouter>().push(const LoginRoute()),
        child: const Text(
          'Login please',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
