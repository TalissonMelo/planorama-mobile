class UserRequest {
  String email;
  String nickname;
  String phone;
  String password;

  UserRequest({
    required this.email,
    required this.nickname,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nickname': nickname,
      'phone': phone,
      'password': password
    };
  }
}
