String? nameValidator(String? name) {
  if (name == null || name.isEmpty) return 'Enter your name!';

  if (name.split(" ").length == 1) return 'Enter your full name!';

  return null;
}
