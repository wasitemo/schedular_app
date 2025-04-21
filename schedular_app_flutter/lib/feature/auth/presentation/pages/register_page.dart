import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_app_flutter/core/utils/input_validator.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_state.dart';

import '../bloc/auth_event.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            RegisterEvent(
                username: usernameController.text,
                email: emailController.text,
                password: passwordController.text),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: Column(
          children: [
            Center(
              child: Text('Register'),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                    validator: (value) {
                      if (!InputValidator.isUserValidUsername(value ?? "")) {
                        return "Username must be filled in";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (!InputValidator.isEmailValid(value ?? "")) {
                        return "Invalid email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) {
                      if (!InputValidator.isValidPassword(value ?? "")) {
                        return "Invalid password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onRegister,
                    child: Text("Register"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text("Sudah punya akun? Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
