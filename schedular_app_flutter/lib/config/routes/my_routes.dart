import 'package:go_router/go_router.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/pages/register_page.dart';

class MyRouter {
  get router => GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            name: 'register',
            pageBuilder: (ctx, state) => NoTransitionPage(
              child: RegisterPage(),
            ),
          ),
        ],
      );
}
