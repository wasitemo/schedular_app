import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository registerRepository;

  const RegisterUseCase({required this.registerRepository});

  Future<Either<Failure, UserEntity>> execute(
      String username, String email, String password) async {
    return await registerRepository.register(username, email, password);
  }
}
