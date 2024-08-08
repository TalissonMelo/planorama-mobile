class UserLogin {
  String id;
  String email;
  String nickname;
  String phone;
  String authorization;

  UserLogin({
    required this.id,
    required this.email,
    required this.nickname,
    required this.phone,
    required this.authorization,
  });

  factory UserLogin.fromMap(Map map) {
    return UserLogin(
        id: map['id'],
        email: map['email'],
        nickname: map['nickname'],
        phone: map['phone'],
        authorization: map['authorization']);
  }
}
