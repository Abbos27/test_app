import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final TokenEntity? token;
  final UserEntity? user;

  const LoginResponseEntity({
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [
    token,
    user,
  ];

  Map<String, dynamic> toJson() {
    return {
      'token': token?.toJson(),
      'user': user?.toJson(),
    };
  }

  static LoginResponseEntity fromJson(Map<String, dynamic> json) {
    return LoginResponseEntity(
      token: json['token'] != null ? TokenEntity.fromJson(json['token']) : null,
      user: json['user'] != null ? UserEntity.fromJson(json['user']) : null,
    );
  }
}

class TokenEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  const TokenEntity({
    this.accessToken,
    this.refreshToken,
  });

  @override
  List<Object?> get props => [
    accessToken,
    refreshToken,
  ];

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  static TokenEntity fromJson(Map<String, dynamic> json) {
    return TokenEntity(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}

class UserEntity extends Equatable {
  final num? id;
  final String? email;
  final String? nickname;

  const UserEntity({
    this.id,
    this.email,
    this.nickname,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    nickname,
  ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'nickname': nickname,
    };
  }

  static UserEntity fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'],
      email: json['email'],
      nickname: json['nickname'],
    );
  }
}
