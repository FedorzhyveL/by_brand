import 'package:auto_route/auto_route.dart';
import 'package:by_brand/presentation/widgets/text_input_form.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
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
                textController: _firstNameController,
                label: 'First Name',
              ),
              const SizedBox(height: 20),
              TextInputForm(
                textController: _lastNameController,
                label: 'Last Name',
              ),
              const SizedBox(height: 20),
              TextInputForm(
                textController: _emailController,
                label: 'Email',
              ),
              const SizedBox(height: 20),
              TextInputForm(
                textController: _passwordController,
                label: 'Password',
              ),
              const SizedBox(height: 20),
              TextInputForm(
                textController: _confirmPasswordController,
                label: 'Confirm Password',
              ),
              const SizedBox(height: 40),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
