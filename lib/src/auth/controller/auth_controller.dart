import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/auth/service/auth_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authService = AuthService();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    authService.execute(Login(email: email, password: password));

    isLoading.value = false;
  }
}
