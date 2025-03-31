import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository authRepository;

  const LogoutUseCase({required this.authRepository});

  Future<void> execute() async {
    return await authRepository.logout();
  }
}
