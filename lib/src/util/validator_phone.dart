import 'package:get/get.dart';

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) return 'Enter your phone number!';

  if (phone.length < 14 || !phone.isPhoneNumber) {
    return 'Please enter a valid number!';
  }

  return null;
}
