import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:schedular_app_flutter/core/network/network_info.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:schedular_app_flutter/feature/auth/data/model/user_model.dart';
import 'package:schedular_app_flutter/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:schedular_app_flutter/feature/auth/domain/repositories/auth_repository.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/get_token_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/login_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/logout_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/domain/use_cases/register_use_case.dart';
import 'package:schedular_app_flutter/feature/auth/presentation/bloc/auth_bloc.dart';

var sl = GetIt.instance;

//Feature auth
Future<void> init() async {
  Hive.registerAdapter(UserModelAdapter());
  final box = await Hive.openBox('token');

  sl.registerLazySingleton(() => box);
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //bloc
  sl.registerFactory(
    () => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),
      getTokenUseCase: sl(),
      logoutUseCase: sl(),
    ),
  );

  //use case
  sl.registerLazySingleton(() => RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(authRepository: sl()));

  //repository implementation
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //data source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(box: sl()));
}
