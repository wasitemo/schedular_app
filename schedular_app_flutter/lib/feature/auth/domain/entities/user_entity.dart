import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserEntity extends Equatable {
  @HiveField(0)
  final String username;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String? token;

  const UserEntity({
    required this.username,
    required this.email,
    required this.password,
    this.token,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
        token,
      ];
}
