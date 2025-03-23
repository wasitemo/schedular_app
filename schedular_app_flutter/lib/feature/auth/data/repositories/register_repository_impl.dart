import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/register_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/data/model/register_model.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/register_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImpl({required this.registerRemoteDataSource});

  @override
  Future<Either<Failure, RegisterEntity>> registerUser(
      String username, String email, String password) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());

      if (connectivityResult.contains(ConnectivityResult.none)) {
        throw GeneralException(message: 'Can\'t connect to internet');
      } else {
        final RegisterModel registerUser = await registerRemoteDataSource
            .registerUser(username, email, password);

        return Right(registerUser);
      }
    } catch (error) {
      return Left(Failure());
    }
  }
}
