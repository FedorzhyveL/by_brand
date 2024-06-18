import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:by_brand/core/di.dart';
import 'package:by_brand/presentation/navigation/app_router.dart';
import 'package:by_brand/presentation/widgets/text_input_form.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextInputForm(
                textController: _emailController,
                label: 'Email',
              ),
              const SizedBox(height: 20),
              TextInputForm(
                textController: _passwordController,
                label: 'Password',
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => injector.get<AppRouter>().push(
                      const RegistrationRoute(),
                    ),
                child: const Text(
                  'or register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
