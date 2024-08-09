import 'dart:convert';

class UserLogin {
  String? id;
  String? email;
  String? nickname;
  String? phone;
  String? authorization;

  UserLogin({
    this.id,
    this.email,
    this.nickname,
    this.phone,
    this.authorization,
  });

  factory UserLogin.fromMap(Map map) {
    return UserLogin(
        id: map['id'],
        email: map['email'],
        nickname: map['nickname'],
        phone: map['phone'],
        authorization: map['authorization']);
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
      phone: map['phone'],
      authorization: map['authorization'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'nickname': nickname,
      'phone': phone,
      'authorization': authorization,
    };
  }
}
