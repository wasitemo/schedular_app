import 'package:bloc/bloc.dart';
import 'package:schedular_app_flutter/feature/auth/domain/entities/user_entity.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/get_token_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/logout_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/register_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_event.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_state.dart';

import '../../../../core/error/failure.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final GetTokenUseCase getTokenUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getTokenUseCase,
    required this.logoutUseCase,
  }) : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      final registerResult = await registerUseCase.execute(
        event.username,
        event.email,
        event.password,
      );
      registerResult.fold((ifLeftRegisterResult) {
        emit(
          AuthError(
            message: _mapFailureToMessage(ifLeftRegisterResult),
          ),
        );
      }, (ifRightRegisterResult) {
        emit(AuthRegistered());
      });
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      final loginResult =
          await loginUseCase.execute(event.email, event.password);
      loginResult.fold((ifLeftLoginResult) {
        emit(
          AuthError(
            message: _mapFailureToMessage(ifLeftLoginResult),
          ),
        );
      }, (ifRightLoginResult) {
        emit(
          AuthAuthenticated(ifRightLoginResult),
        );
      });
    });

    on<GetTokenEvent>((event, emit) async {
      final getTokenResult = await getTokenUseCase.execute();
      getTokenResult.fold((ifLeftGetTokenResult) {
        emit(AuthUnAuthenticated());
      }, (ifRightGetTokenResult) {
        emit(
          AuthAuthenticated(
            UserEntity(
                username: '',
                email: '',
                password: '',
                token: ifRightGetTokenResult),
          ),
        );
      });
    });

    on<LogoutEvent>((event, emit) async {
      await logoutUseCase.execute();
      emit(AuthUnAuthenticated());
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) return "Server Error";
    if (failure is CacheFailure) return "No Internet Connection";
    return "Unexpected Error";
  }
}
