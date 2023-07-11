import 'package:test_app/features/auth/domain/entities/login/login_response_entity.dart';

class LoginResponseModel {
  LoginResponseModel({
    this.tokens,
    this.user,
  });

  LoginResponseModel.fromJson(dynamic json) {
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Tokens? tokens;
  UserModel? user;

  LoginResponseModel copyWith({
    Tokens? tokens,
    UserModel? user,
  }) =>
      LoginResponseModel(
        tokens: tokens ?? this.tokens,
        user: user ?? this.user,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.nickname,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    nickname = json['nickname'];
  }

  num? id;
  String? email;
  String? nickname;

  UserModel copyWith({
    num? id,
    String? email,
    String? nickname,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        nickname: nickname ?? this.nickname,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['nickname'] = nickname;
    return map;
  }
}

class Tokens {
  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  Tokens.fromJson(dynamic json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  String? accessToken;
  String? refreshToken;

  Tokens copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      Tokens(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }
}

extension LoginResponseExtension on LoginResponseModel {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      user: UserEntity(
        id: user?.id,
        email: user?.email,
        nickname: user?.email,
      ),
      token: TokenEntity(
        accessToken: tokens?.accessToken,
        refreshToken: tokens?.refreshToken,
      ),
    );
  }
}
