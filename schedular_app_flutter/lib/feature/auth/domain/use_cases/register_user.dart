import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/register_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/register_repository.dart';

class RegisterUser {
  final RegisterRepository registerRepository;

  const RegisterUser({required this.registerRepository});

  Future<Either<Failure, RegisterEntity>> execute(
      String username, String email, String password) async {
    return await registerRepository.registerUser(username, email, password);
  }
}
