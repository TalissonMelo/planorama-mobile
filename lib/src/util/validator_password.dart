String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) return 'Digite sua senha.';

  final RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,12}$');

  if (!passwordRegex.hasMatch(password)) {
    return 'Senha inválida. Deve ter entre 8 e 12 caracteres, incluindo letras maiúsculas, minúsculas, números e caracteres especiais.';
  }

  return null;
}
