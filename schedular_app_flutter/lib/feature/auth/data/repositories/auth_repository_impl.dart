import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/core/network/network_info.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSourceImpl remoteDataSourceImpl;
  final AuthLocalDataSourceImpl localDataSourceImpl;
  final NetworkInfoImpl networkInfoImpl;

  AuthRepositoryImpl({
    required this.remoteDataSourceImpl,
    required this.localDataSourceImpl,
    required this.networkInfoImpl,
  });

  @override
  Future<Either<Failure, UserEntity>> register(
      String username, String email, String password) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final user =
            await remoteDataSourceImpl.register(username, email, password);

        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final user = await remoteDataSourceImpl.login(email, password);
        await localDataSourceImpl.cacheToken(user.token ?? "");

        return Right(user);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    final token = await localDataSourceImpl.getToken();

    if (token != null) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> logout() async {
    await localDataSourceImpl.clearToken();
  }
}
