import 'dart:convert';

import 'package:test_app/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:test_app/error/exceptions.dart';
import 'package:test_app/features/auth/domain/entities/login/login_response_entity.dart';

class LocalSource {
  final Box<dynamic> _box;

  LocalSource(this._box);

  Future<void> clear() async {
    await _box.clear();
  }

  Future<void> setUser(LoginResponseEntity user) async {
    await _box.put(AppKeys.user, jsonEncode(user.toJson()));
  }

  LoginResponseEntity getUser() {
    try {
      final json = jsonDecode(_box.get(AppKeys.user));
      LoginResponseEntity user = LoginResponseEntity.fromJson(json);
      return user;
    } catch (e) {
      throw NoUserFoundException();
    }
  }
}
