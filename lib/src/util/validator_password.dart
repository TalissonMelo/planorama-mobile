String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) return 'Enter your password.';

  final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,50}$');

  if (!passwordRegex.hasMatch(password)) {
    return 'Invalid password. Must be between 8 and 50 characters long, including uppercase letters, lowercase letters, numbers, and special characters.';
  }

  return null;
}
