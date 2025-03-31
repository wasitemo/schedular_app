import 'package:equatable/equatable.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity userEntity;

  AuthAuthenticated(this.userEntity);
}

class AuthRegistered extends AuthState {}

class AuthUnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
