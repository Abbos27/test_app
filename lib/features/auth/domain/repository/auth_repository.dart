import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:test_app/core/platform/network_info.dart';
import 'package:test_app/error/exceptions.dart';
import 'package:test_app/error/failure.dart';
import 'package:test_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:test_app/features/auth/data/models/login/login_request_model.dart';
import 'package:test_app/features/auth/data/models/login/login_response_model.dart';
import 'package:test_app/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:test_app/features/auth/domain/entities/login/login_response_entity.dart';

part 'package:test_app/features/auth/data/repository/auth_repository_impl.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponseEntity>> login(
    LoginRequestEntity requestEntity,
  );
}
