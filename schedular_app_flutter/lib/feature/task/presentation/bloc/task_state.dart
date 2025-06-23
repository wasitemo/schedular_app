import 'package:equatable/equatable.dart';

abstract class TaskState extends Equatable {}

class InitialTaskState extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskLoadingState extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskErrorState extends TaskState {
  final String message;

  TaskErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class TaskInputSuccess extends TaskState {
  final String message;

  TaskInputSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}
