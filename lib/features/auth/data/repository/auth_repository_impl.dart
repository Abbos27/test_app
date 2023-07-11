part of 'package:test_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity requestEntity,
  ) async {
    final request = LoginRequestModel(
      email: requestEntity.username,
      password: requestEntity.password,
    );
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(NoInternetFailure());
    }
    try {
      final response = await authRemoteDataSource.login(request);
      return Right(response.toEntity());
    } catch (e) {
      debugPrint('Login error: $e');
      return Left(ServerFailure(message: (e is ServerException) ? e.message : 'ERROR'));
    }
  }
}
