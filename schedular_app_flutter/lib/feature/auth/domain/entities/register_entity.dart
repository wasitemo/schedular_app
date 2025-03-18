import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String username;
  final String email;
  final String password;

  const RegisterEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        password,
      ];
}
