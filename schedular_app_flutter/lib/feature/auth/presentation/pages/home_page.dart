import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
