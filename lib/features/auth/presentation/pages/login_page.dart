import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/enums/status.dart';
import 'package:test_app/core/utils/app_utils.dart';
import 'package:test_app/core/widgets/snack_bar/snack_bar.dart';
import 'package:test_app/features/auth/data/models/login/login_request_model.dart';
import 'package:test_app/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:test_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:test_app/injector_container.dart';
import 'package:test_app/routes/guards/auth_guard.dart';

part 'mixins/login_mixins.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  final Function(bool isLoggedIn)? onLoginResult;

  const LoginPage({
    super.key,
    this.onLoginResult,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: LoginPageBody(onLoginResult: onLoginResult),
    );
  }
}

class LoginPageBody extends StatefulWidget {
  final Function(bool isLoggedIn)? onLoginResult;

  const LoginPageBody({super.key, this.onLoginResult});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> with LoginMixin {
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state.showLoginErrorMessage) {
          MySnackBar.showErrorSnackBar(
            context: context,
            message: state.loginErrorMessage ?? 'Ошибка',
          );
        }
        if (state.loginStatus.isSuccess) {
          sl<AuthService>().isAuthenticated = true;
          widget.onLoginResult?.call(true);
        }
      },
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Авторизация"),
          ),
          body: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).viewInsets.top,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        scrollPadding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Логин или почта',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите почту или логин';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _username = value;
                        },
                      ),
                    ),
                    const Padding(
                      padding: AppUtils.kPaddingHor12,
                      child: AppUtils.kDivider,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Пароль',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Введите пароль';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // _password = value;
                        },
                      ),
                    ),
                    AppUtils.kBoxHeight24,
                    Padding(
                      padding: AppUtils.kPaddingAll12,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: _login,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (state.loginStatus.isLoading) ...[
                                  const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator.adaptive(
                                      strokeWidth: 3,
                                      valueColor: AlwaysStoppedAnimation(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                  AppUtils.kBoxWidth6,
                                ],
                                const Text('Войти'),
                              ],
                            ),
                          ),
                          AppUtils.kBoxHeight16,
                          const ElevatedButton(
                            onPressed: null,
                            child: Text('Зарегистрироваться'),
                          ),
                        ],
                      ),
                    ),
                    AppUtils.kBoxHeight54,

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
