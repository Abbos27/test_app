part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Status loginStatus;
  final String? loginErrorMessage;
  final bool showLoginErrorMessage;

  const LoginState({
    this.loginStatus = Status.initial,
    this.loginErrorMessage,
    this.showLoginErrorMessage = false,
  });

  LoginState copyWith({
    Status? loginStatus,
    String? loginErrorMessage,
    bool? showLoginErrorMessage,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      showLoginErrorMessage: showLoginErrorMessage ?? false,
    );
  }

  @override
  List<Object?> get props => [
        loginStatus,
        loginErrorMessage,
        showLoginErrorMessage,
      ];
}
