import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:schedular_app_flutter/core/error/exception.dart';
import 'package:schedular_app_flutter/feature/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> register(String username, String email, String password);
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final http.Client client;
  static final String? _api = dotenv.env['API'];
  static final String? _apiUrl = dotenv.env['API_URL'];

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> register(
      String username, String email, String password) async {
    final url = Uri.http('$_api', '$_apiUrl/register.php');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'username': username,
        'email': email,
        'password': password,
        'token': ""
      }),
    );

    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else {
      throw ServerException(message: "Email or Username has been registered");
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final url = Uri.http('$_api', '$_apiUrl/login.php');
    final response = await client.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(
          {'email': email, 'password': password},
        ));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return UserModel.fromJson(jsonData);
    } else {
      throw ServerException(message: 'Server issue');
    }
  }
}
