import 'package:test_app/features/auth/data/models/login/login_request_model.dart';
import 'package:test_app/features/auth/data/models/login/login_response_model.dart';
import 'package:dio/dio.dart';
import 'package:test_app/constants/constants.dart';
import 'package:test_app/error/exceptions.dart';
import 'dart:convert';

part 'auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel userRequestModel);
}
