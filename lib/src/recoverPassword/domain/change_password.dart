class ChangePassword {
  String code;
  String email;
  String newPassword;

  ChangePassword({
    required this.code,
    required this.email,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'email': email,
      'newPassword': newPassword,
    };
  }
}
