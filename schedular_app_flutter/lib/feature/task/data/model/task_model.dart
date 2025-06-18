import 'package:schedular_app_flutter/core/utils/parse_string_json.dart';
import 'package:schedular_app_flutter/feature/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    required super.categoryName,
    required super.memberName,
    required super.taskName,
    required super.frequency,
    required super.period,
    required super.selectedDate,
    required super.time,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      categoryName: ParseStringJson.parseString(json['categoryname']),
      memberName: ParseStringJson.parseString(json['membername']),
      taskName: ParseStringJson.parseString(json['taskname']),
      frequency: ParseStringJson.parseString(json['frequency']),
      period: ParseStringJson.parseToInt(json['period']),
      selectedDate: ParseStringJson.parseString(json['selectdate']),
      time: ParseStringJson.parseString('time'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categoryname": categoryName,
      "membername": memberName,
      "taskname": taskName,
      "frequency": frequency,
      "period": period,
      "selectdate": selectedDate,
      "time": time,
    };
  }
}
