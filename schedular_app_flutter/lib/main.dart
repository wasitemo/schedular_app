import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:schedular_app_flutter/core/routes/my_routes.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_bloc.dart';

import 'injection_container.dart' as di;

void main() async {
  await Hive.initFlutter();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (_) => di.sl<AuthBloc>())],
      child: MaterialApp.router(
        routerConfig: MyRouter().router,
      ),
    );
  }
}
