import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/feature/auth/data/model/register_model.dart';

abstract class RegisterDataSource {
  Future<RegisterModel> registerUser(
      String username, String email, String password);
}

class RegisterRemoteDataSource extends RegisterDataSource {
  final http.Client client;

  RegisterRemoteDataSource({required this.client});

  @override
  Future<RegisterModel> registerUser(
      String username, String email, String password) async {
    final url = Uri.http('127.0.0.1', 'schedular-app/register.php');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      throw const StatusCodeException(message: 'Registration successful');
    } else {
      throw const StatusCodeException(
          message: 'Username or email already registered');
    }
  }
}
