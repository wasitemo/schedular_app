import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(
      String username, String email, String password);
  Future<Either<Failure, UserEntity>> login(String email, String password);
}
