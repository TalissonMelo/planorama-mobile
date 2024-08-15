class User {
  String id;
  String email;
  String nickname;
  String phone;

  User({
    required this.id,
    required this.email,
    required this.nickname,
    required this.phone,
  });

  static User fromMap(Map map) {
    return User(
        id: map['id'],
        email: map['email'],
        nickname: map['nickname'],
        phone: map['phone']);
  }
}
