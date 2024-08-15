import 'package:get/get.dart';

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) return 'Digite seu número de telefone!';

  if (phone.length < 14 || !phone.isPhoneNumber)
    return 'Digite um número válido!';

  return null;
}
