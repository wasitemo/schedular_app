import 'package:bloc/bloc.dart';
import 'package:schedular_app_flutter/core/error/failure.dart';
import 'package:schedular_app_flutter/feature/task/domain/use_cases/add_task_use_case.dart';
import 'package:schedular_app_flutter/feature/task/presentation/bloc/task_event.dart';
import 'package:schedular_app_flutter/feature/task/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTaskUseCase addTaskUseCase;

  TaskBloc({required this.addTaskUseCase}) : super(InitialTaskState()) {
    on<TaskInputEvent>(_onTaskInput);
  }

  Future<void> _onTaskInput(
      TaskInputEvent event, Emitter<TaskState> emit) async {
    emit(TaskLoadingState());

    final inputResult = await addTaskUseCase.execute(
      event.idTask,
      event.userId,
      event.categoryName,
      event.memberName,
      event.taskName,
      event.frequency,
      event.period,
      event.selectedDate,
      event.time,
    );

    inputResult.fold((error) {
      emit(
        TaskErrorState(
          message: _mapFailureMessage(error),
        ),
      );
    }, (success) {
      emit(
        TaskInputSuccess(message: 'Input Success'),
      );
    });
  }

  String _mapFailureMessage(Failure failure) {
    return failure.message;
  }
}
