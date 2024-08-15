class UserRequest {
  String? email;
  String? nickname;
  String? phone;
  String? password;

  UserRequest({
    this.email,
    this.nickname,
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'nickname': nickname,
      'phone': phone,
      'password': password
    };
  }
}
