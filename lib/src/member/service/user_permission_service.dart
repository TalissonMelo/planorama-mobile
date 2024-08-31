import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/components/custom_api_advice.dart';
import 'package:liberbox_mobile/src/member/domain/user_permissions.dart';
import 'package:liberbox_mobile/src/member/repository/user_permission_repository.dart';
import 'package:liberbox_mobile/src/member/service/result/user_permission_result.dart';

class UserPermissionService {
  final userPermissionRepository = UserPermissionRepository();
  final authController = Get.find<AuthController>();

  Future<UserPermissionResult> execute() async {
    CustomApiAdvice result = await userPermissionRepository.execute(
      authController.user.id!,
      'Bearer ${authController.user.authorization}',
    );

    try {
      if (result.success) {
        UserPermissions user = UserPermissions.fromMap(result.data);
        return UserPermissionResult.success(user);
      } else {
        return UserPermissionResult.error(
            result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return UserPermissionResult.error(result.errorMessage ?? '');
    }
  }
}
