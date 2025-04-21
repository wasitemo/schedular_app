import 'package:hive/hive.dart';
import 'package:schedular_app_flutter/core/utils/parse_string_json.dart';
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
      username: ParseStringJson.parseString(json['username']),
      email: ParseStringJson.parseString(json['email']),
      password: ParseStringJson.parseString(json['password']),
      token: json['token'] != null ? json['token'] as String : null,
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
