import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) return 'Enter your best email!';

  if (!email.isEmail) return 'Please enter a valid email address!';

  return null;
}
