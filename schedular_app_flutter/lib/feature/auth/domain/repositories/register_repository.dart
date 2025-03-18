import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/register_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterEntity>> registerUser(
      String username, String email, String password);
}
