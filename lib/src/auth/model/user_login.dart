import 'dart:convert';

class UserLogin {
  String? id;
  String? email;
  String? nickname;
  String? accessToken;
  String? refreshToken;

  UserLogin({
    this.id,
    this.email,
    this.nickname,
    this.accessToken,
    this.refreshToken,
  });

  factory UserLogin.fromMap(Map map) {
    return UserLogin(
        id: map['id'],
        email: map['email'],
        nickname: map['nickname'],
        accessToken: map['accessToken'],
        refreshToken: map['refreshToken']);
  }

  String toJson() => json.encode(toMap());

  static Future<UserLogin?> fromJson(String userJson) async {
    return UserLogin.fromMapSession(json.decode(userJson));
  }

  factory UserLogin.fromMapSession(Map<String, dynamic> map) {
    return UserLogin(
      id: map['id'],
      email: map['email'],
      nickname: map['nickname'],
      accessToken: map['accessToken'],
      refreshToken: map['refreshToken'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nickname': nickname,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
