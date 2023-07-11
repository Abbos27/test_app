part of 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<LoginResponseModel> login(LoginRequestModel userRequestModel) async {
    try {
      final response = await dio.post(
        "${Constants.baseUrl}${Urls.login}",
        data: jsonEncode(userRequestModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    }
  }
}
