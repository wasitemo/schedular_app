import 'package:dartz/dartz.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';
import 'package:schedular_app_flutter/feature/task/domain/repositories/task_repository.dart';

class AddTaskUseCase {
  final TaskRepository taskRepository;

  const AddTaskUseCase({required this.taskRepository});

  Future<Either<Failure, TaskEntity>> execute(
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
    return await taskRepository.addTask(
      idTask,
      userId,
      categoryName,
      memberName,
      taskName,
      frequency,
      period,
      selectedDate,
      time,
    );
  }
}
