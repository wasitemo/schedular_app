import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:schedular_app_flutter/feature/task/data/model/task_model.dart';

import '../../../../../core/error/exception.dart';

abstract class TaskRemoteDataSource {
  Future<TaskModel> addTask(
    String categoryName,
    String memberName,
    String taskName,
    String frequency,
    int period,
    String selectedDate,
    String time,
  );
}

class TaskRemoteDataSourceImpl extends TaskRemoteDataSource {
  final http.Client client;
  static final String? _api = dotenv.env['API'];
  static final String? _apiUrl = dotenv.env['API_URL'];

  TaskRemoteDataSourceImpl({required this.client});

  @override
  Future<TaskModel> addTask(
      String categoryName,
      String memberName,
      String taskName,
      String frequency,
      int period,
      String selectedDate,
      String time) async {
    final url = Uri.http('$_api', '$_apiUrl/tasks.php');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "categoryname": categoryName,
        "membername": memberName,
        "taskname": taskName,
        "frequency": frequency,
        "period": period,
        "selectdate": selectedDate,
        "time": time,
      }),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return TaskModel.fromJson(jsonData);
    } else {
      throw ServerException(message: "Failed to add task");
    }
  }
}
