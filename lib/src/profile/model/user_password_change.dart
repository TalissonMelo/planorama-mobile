class UserPasswordChange {
  String oldPassword;
  String newPassword;

  UserPasswordChange({
    required this.newPassword,
    required this.oldPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'newPassword': newPassword,
      'oldPassword': oldPassword,
    };
  }
}
