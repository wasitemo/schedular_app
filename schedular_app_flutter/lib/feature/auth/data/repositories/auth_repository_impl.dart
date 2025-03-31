import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImp registerRemoteDataSource;

  AuthRepositoryImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> register(
      String username, String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) {
    throw UnimplementedError();
  }
}
