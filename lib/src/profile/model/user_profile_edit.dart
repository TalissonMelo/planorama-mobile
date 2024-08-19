class UserProfileEdit {
  String nickname;
  String phone;

  UserProfileEdit({
    required this.nickname,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'phone': phone,
    };
  }
}
