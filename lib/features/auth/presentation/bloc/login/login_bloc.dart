import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/enums/status.dart';
import 'package:test_app/error/exceptions.dart';
import 'package:test_app/error/failure.dart';
import 'package:test_app/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:test_app/features/auth/domain/usecases/login.dart';
import 'package:test_app/injector_container.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(
    this._loginUseCase,
  ) : super(const LoginState()) {
    on<LoginUserEvent>(_loginUser);
  }

  Future<void> _loginUser(
    LoginUserEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginStatus: Status.loading));

    final response = await _loginUseCase(
      LoginParams(
        loginRequestEntity: event.loginRequest,
      ),
    );
    await response.fold(
      (error) {
        String errorMessage =
            (error is ServerFailure) ? error.message : "Ошибка";
        emit(state.copyWith(
          loginStatus: Status.error,
          loginErrorMessage: errorMessage,
          showLoginErrorMessage: true,
        ));
      },
      (user) async {
        await localSource.setUser(user);
        emit(state.copyWith(
          loginStatus: Status.success,
        ));
      },
    );
  }
}
