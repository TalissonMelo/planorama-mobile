import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/auth/service/auth_service.dart';
import 'package:liberbox_mobile/src/auth/service/result/auth_result.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authService = AuthService();
  final toast = CustomToast();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authService.execute(Login(email: email, password: password));

    result.when(success: (user) {
      Get.offAllNamed(PagesRoutes.baseRoute);
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
