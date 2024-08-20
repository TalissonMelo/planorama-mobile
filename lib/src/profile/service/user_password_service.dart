import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/profile/model/user_password_change.dart';
import 'package:liberbox_mobile/src/profile/repository/user_password_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_password_result.dart';

class UserPasswordService {
  final userPasswordRepository = UserPasswordRepository();
  final authController = Get.find<AuthController>();

  Future<UserPasswordResult> execute(
    UserPasswordChange password,
  ) async {
    final result = await userPasswordRepository.execute(
      authController.user.id!,
      password,
      'Bearer ${authController.user.authorization}',
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
