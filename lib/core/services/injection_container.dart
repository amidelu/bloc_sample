import 'package:dio/dio.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/datasource/authentication_remote_datasource.dart';
import 'package:diu_qr_code_scanner/features/authentication/data/repository/authentication_repository_implementation.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/repositories/authertication_repository.dart';
import 'package:diu_qr_code_scanner/features/authentication/domain/usecases/login.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // using cascade notation (Syntactic Sugar) to make a sequence of operation on the same object
  sl
    // App Logic
    ..registerFactory(() => AuthenticationBloc(login: sl()))

    // Use cases
    ..registerLazySingleton(() => Login(sl()))

    // Repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sl()))

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDatasource>(
        () => AuthRemoteDataSrcImpl(sl()))

    // External Dependencies
    ..registerLazySingleton(Dio.new);
}
