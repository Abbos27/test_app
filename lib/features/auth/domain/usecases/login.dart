import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/core/usecase/usecase.dart';
import 'package:test_app/error/failure.dart';
import 'package:test_app/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:test_app/features/auth/domain/entities/login/login_response_entity.dart';
import 'package:test_app/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<LoginResponseEntity, LoginParams> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, LoginResponseEntity>> call(LoginParams params) async {
    final response = await _authRepository.login(params.loginRequestEntity);
    return response;
  }
}

class LoginParams extends Equatable {
  final LoginRequestEntity loginRequestEntity;

  const LoginParams({
    required this.loginRequestEntity,
  });

  @override
  List<Object?> get props => [
        loginRequestEntity,
      ];
}
