class LoginRequestModel {
  LoginRequestModel({
    this.email,
    this.password,
  });

  LoginRequestModel.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }

  String? email;
  String? password;

  LoginRequestModel copyWith({
    String? email,
    String? password,
  }) =>
      LoginRequestModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }
}
