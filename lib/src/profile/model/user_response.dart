class UserResponse {
  String? id;
  String? email;
  String? nickname;
  String? phone;

  UserResponse({
    this.id,
    this.email,
    this.nickname,
    this.phone,
  });

  factory UserResponse.fromMap(Map map) {
    return UserResponse(
      id: map['id'],
      email: map['email'],
      nickname: map['nickname'],
      phone: map['phone'],
    );
  }
}
