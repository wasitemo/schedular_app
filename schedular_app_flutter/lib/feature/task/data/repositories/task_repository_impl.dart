import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/core/network/network_info.dart';
import 'package:schedular_app_flutter/feature/task/data/data_sources/remote/task_remote_data_source.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';
import 'package:schedular_app_flutter/feature/task/domain/repositories/task_repository.dart';

import '../../../../core/error/exception.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskRemoteDataSource taskRemoteDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.taskRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TaskEntity>> addTask(
    int? idTask,
    int? userId,
    String categoryName,
    String memberName,
    String taskName,
    String frequency,
    int period,
    String selectedDate,
    String time,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final task = await taskRemoteDataSource.addTask(
          categoryName,
          memberName,
          taskName,
          frequency,
          period,
          selectedDate,
          time,
        );

        return Right(task);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
