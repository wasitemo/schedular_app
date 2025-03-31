import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String username;
  final String email;
  final String password;
  final String? token;

  const UserEntity(
      {required this.username,
      required this.email,
      required this.password,
      this.token});

  @override
  List<Object?> get props => [
        username,
        email,
        password,
      ];
}
