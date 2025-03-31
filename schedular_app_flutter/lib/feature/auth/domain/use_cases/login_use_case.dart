import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  const LoginUseCase({required this.authRepository});

  Future<Either<Failure, UserEntity>> execute(
      String email, String password) async {
    return await authRepository.login(email, password);
  }
}
