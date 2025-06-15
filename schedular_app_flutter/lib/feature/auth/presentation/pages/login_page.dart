import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_event.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_state.dart';

import '../../../../core/utils/input_validator.dart';
import '../widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      context.read<AuthBloc>().add(
            LoginEvent(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (ctx, state) {
        if (_isLoading && state is! AuthLoading) {
          setState(() {
            _isLoading = false;
          });
        }
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Berhasil!'),
              backgroundColor: Colors.green,
            ),
          );
          context.go('/home');
        } else if (state is AuthUnAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          context.go('/');
        }
      },
      builder: (bctx, bstate) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    heightFactor: 7,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: InputValidator.isEmailValid,
                        ),
                        SizedBox(height: 29),
                        PasswordField(
                          passwordController: passwordController,
                          validator: InputValidator.isValidPassword,
                          label: 'Password',
                        ),
                        SizedBox(height: 45),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _onLogin,
                            child: _isLoading
                                ? const CircularProgressIndicator()
                                : const Text("Login"),
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun?',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go('/');
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size(0, 0),
                              ),
                              child: Text(
                                "Register",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
