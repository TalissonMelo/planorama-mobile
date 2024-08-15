String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return 'Digite seu nome!';

  if (name.split(" ").length == 1) return 'Digite seu nome completo!';

  return null;
}
