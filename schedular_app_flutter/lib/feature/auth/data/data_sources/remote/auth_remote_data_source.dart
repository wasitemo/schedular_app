import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/feature/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(String username, String email, String password);
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> register(
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
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else {
      throw const StatusCodeException(
          message: 'Username or email already registered');
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final url = Uri.http('127.0.0.1', 'schedular-app/login.php');
    final response = await client.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {'email': email, 'password': password},
        ));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return UserModel.fromJson(jsonData);
    } else {
      throw const StatusCodeException(message: 'Incorrect password or email');
    }
  }
}
