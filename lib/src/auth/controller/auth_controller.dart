import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/model/login.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';
import 'package:liberbox_mobile/src/auth/service/auth_service.dart';
import 'package:liberbox_mobile/src/auth/service/result/auth_result.dart';
import 'package:liberbox_mobile/src/auth/service/validate_token_service.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/config/constants/storage_keys.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  UserLogin user = UserLogin();

  final validateToken = ValidateTokenService();
  final authService = AuthService();
  final utilService = UtilService();
  final toast = CustomToast();

  @override
  void onInit() {
    super.onInit();

    validToken();
  }

  void saveUserStorage() {
    utilService.saveLocalUser(key: StorageKeys.user, login: user);
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> validToken() async {
    await validateToken.validToken();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authService.execute(Login(email: email, password: password));

    result.when(success: (user) {
      saveUserStorage();
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
