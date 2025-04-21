import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/core/network/network_info.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserEntity>> register(
      String username, String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.register(username, email, password);

        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.login(email, password);
        final token = user.token;

        if (token != null) {
          await localDataSource.cacheToken(token);
        }

        return Right(user);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getToken() async {
    final token = await localDataSource.getToken();

    if (token != null) {
      return Right(token);
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }
}
