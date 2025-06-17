import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
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
  );
}
