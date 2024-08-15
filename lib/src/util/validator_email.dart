import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) return 'Digite seu melhor email!';

  if (!email.isEmail) return 'Digite um email válido!';

  return null;
}
