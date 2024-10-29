import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';
import 'package:liberbox_mobile/src/profile/repository/configuration_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_password_result.dart';

class ConfigurationService {
  final configurationRepository = ConfigurationRepository();
  final authController = Get.find<AuthController>();

  Future<UserPasswordResult> execute(
    Configuration configuration,
  ) async {
    final result = await configurationRepository.execute(
      authController.user.id!,
      configuration,
      'Bearer ${authController.user.accessToken}',
    );

    try {
      if (result.success) {
        return UserPasswordResult.success();
      } else {
        return UserPasswordResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return UserPasswordResult.error(result.errorMessage ?? '');
    }
  }
}
