import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  final String message;

  ServerException({
    required this.message,
  });

  factory ServerException.fromJson(Map<String, dynamic> json) {
    try {
      return ServerException(message: json['message']);
    } catch (e, s) {
      if (kDebugMode) {
        print(s);
      }
    }
    return ServerException(message: "");
  }
}

class NoInternetException implements Exception {}

class NoUserFoundException implements Exception {
  NoUserFoundException();
}
