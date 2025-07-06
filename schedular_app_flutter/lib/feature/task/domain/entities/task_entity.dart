import 'package:equatable/equatable.dart';

enum FrequencyTask {
  Everyday,
  EveryWeek,
  EveryMonth,
  EveryYear,
}

class TaskEntity extends Equatable {
  final int? idTask;
  final int? userId;
  final String categoryName;
  final String memberName;
  final String taskName;
  final String frequency;
  final int period;
  final String selectedDate;
  final String time;

  const TaskEntity({
    this.idTask,
    this.userId,
    required this.categoryName,
    required this.memberName,
    required this.taskName,
    required this.frequency,
    required this.period,
    required this.selectedDate,
    required this.time,
  });

  @override
  List<Object?> get props => [
        idTask,
        userId,
        categoryName,
        memberName,
        taskName,
        frequency,
        period,
        selectedDate,
        time,
      ];
}
