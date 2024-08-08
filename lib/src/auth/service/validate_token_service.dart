import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/repository/validate_token_repository.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class ValidateTokenService {
  final tokenRepository = ValidateTokenRepository();

  Future<void> execute(String token) async {
    final result = await tokenRepository.validateToken(token);

    if (!result.success) {
      Get.offAllNamed(PagesRoutes.loginInRoute);
    }
  }
}
