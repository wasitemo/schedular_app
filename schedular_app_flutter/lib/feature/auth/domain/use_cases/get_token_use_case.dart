import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class GetTokenUseCase {
  final AuthRepository authRepository;

  const GetTokenUseCase({required this.authRepository});

  Future<Either<Failure, String>> execute() async {
    return await authRepository.getToken();
  }
}
