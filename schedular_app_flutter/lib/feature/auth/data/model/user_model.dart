import 'package:hive/hive.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends UserEntity {
  const UserModel({
    required super.username,
    required super.email,
    required super.password,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      token: json.containsKey('token') ? json['token'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}
