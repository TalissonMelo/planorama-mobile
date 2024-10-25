import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';
import 'package:liberbox_mobile/src/auth/repository/validate_token_repository.dart';
import 'package:liberbox_mobile/src/config/constants/storage_keys.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class ValidateTokenService {
  final tokenRepository = ValidateTokenRepository();
  final utilService = UtilService();

  Future<void> execute(String token) async {
    final result = await tokenRepository.validateToken(token);

    if (!result.success) {
      signOut();
    } else {
      Get.offAllNamed(PagesRoutes.baseRoute);
    }
  }

  Future<void> signOut() async {
    await utilService.removeLocalData(key: StorageKeys.user);
    Get.offAllNamed(PagesRoutes.loginInRoute);
  }

  Future<void> validToken() async {
    UserLogin? user = await utilService.getLocalUser(key: StorageKeys.user);

    if (user?.accessToken == null) {
      Get.offAllNamed(PagesRoutes.loginInRoute);
      return;
    }

    final authController = Get.find<AuthController>();

    authController.user = user!;
    await execute(user.accessToken!);
  }
}
