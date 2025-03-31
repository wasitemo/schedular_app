import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity extends Equatable {
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
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
