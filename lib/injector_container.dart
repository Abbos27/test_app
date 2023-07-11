import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_app/core/app_bloc/app_bloc.dart';
import 'package:test_app/core/local_source/local_source.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:test_app/features/auth/domain/repository/auth_repository.dart';
import 'package:test_app/features/auth/domain/usecases/login.dart';
import 'package:test_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:test_app/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:test_app/routes/app_router.dart';
import 'package:test_app/routes/guards/auth_guard.dart';

final sl = GetIt.instance;
late LocalSource localSource;
late AppRouter appRouter;
late Box<dynamic> _box;

const box = 'test_app';

Future<void> init() async {
  await _initLocalSource();

  _initAuthServices();
  _initAppRouter();

  sl
    ..registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(
          contentType: 'application/json',
          sendTimeout: const Duration(seconds: 120),
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30),
        )
        ..interceptors.addAll(
          [
            LogInterceptor(
              error: false,
              responseBody: true,
              logPrint: (object) {
                debugPrint(object.toString());
              },
            ),
            // chuck.getDioInterceptor(),
          ],
        ),
    )
    ..registerSingleton<AppBloc>(AppBloc())

    /// Core
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerLazySingleton(() => InternetConnectionCheckerPlus());

  /// Features
  _homeFeature();
  _authFeature();
}

Future<void> _initLocalSource() async {
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  _box = await Hive.openBox<dynamic>(box);
  sl.registerSingleton<LocalSource>(LocalSource(_box));
  localSource = sl<LocalSource>();
}

void _initAuthServices() {
  sl
    ..registerSingleton<AuthService>(AuthService())
    ..registerSingleton<AuthGuard>(AuthGuard(
      sl(),
    ));

  bool isAuthenticated = false;
  try {
    localSource.getUser();
    isAuthenticated = true;
  } catch (e) {
    debugPrint('USER NOT FOUND');
  }
  sl<AuthService>().isAuthenticated = isAuthenticated;
}

void _initAppRouter() {
  sl.registerSingleton<AppRouter>(AppRouter());
  appRouter = sl<AppRouter>();
}

void _homeFeature() {
  sl.registerFactory(
    () => HomeBloc(),
  );
}

void _authFeature() {
  /// Presentation
  sl
    ..registerFactory(
      () => LoginBloc(
        sl(),
      ),
    )

    /// Use cases
    ..registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()))

    /// Repositories
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        authRemoteDataSource: sl(),
        networkInfo: sl(),
      ),
    )

    /// Data and Network
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        dio: sl(),
      ),
    );
}
