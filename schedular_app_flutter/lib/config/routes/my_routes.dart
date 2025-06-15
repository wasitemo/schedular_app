import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_state.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/pages/home_page.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/pages/login_page.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/pages/register_page.dart';

import '../../feature/auth/presentation/bloc/auth_bloc.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class MyRouter {
  final AuthBloc authBloc;

  MyRouter({required this.authBloc});

  get router => GoRouter(
        initialLocation: '/',
        debugLogDiagnostics: true,
        refreshListenable: GoRouterRefreshStream(authBloc.stream),
        redirect: (BuildContext context, GoRouterState state) {
          final authState = authBloc.state;
          final bool isLoggingIn = state.matchedLocation == '/login';
          final bool isRegistering = state.matchedLocation == '/';
          final bool isAuthenticatingPage = isLoggingIn || isRegistering;

          if (authState is AuthInitial || authState is AuthLoading) {
            return null;
          }
          if (authState is AuthAuthenticated) {
            if (isAuthenticatingPage) {
              return '/home';
            }
            return null;
          }
          if (authState is AuthUnAuthenticated || authState is AuthError) {
            if (!isAuthenticatingPage) {
              return '/';
            }
          }
          return null;
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'register',
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: RegisterPage(),
            ),
          ),
          GoRoute(
            path: '/login',
            name: 'login',
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: LoginPage(),
            ),
          ),
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: HomePage(),
            ),
          ),
        ],
      );
}
