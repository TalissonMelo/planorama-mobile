import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/profile/model/user_profile_edit.dart';
import 'package:liberbox_mobile/src/profile/model/user_response.dart';
import 'package:liberbox_mobile/src/profile/repository/user_profile_repository.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_profile_result.dart';

class UserProfileService {
  final userProfileRepository = UserProfileRepository();
  final authController = Get.find<AuthController>();

  Future<UserProfileResult> execute(
    UserProfileEdit user,
  ) async {
    final result = await userProfileRepository.execute(
      authController.user.id!,
      user,
      'Bearer ${authController.user.authorization}',
    );

    try {
      if (result.success) {
        UserResponse user = UserResponse.fromMap(result.data);
        return UserProfileResult.success(user);
      } else {
        return UserProfileResult.error(result.errorMessage ?? 'Unknown error');
      }
    } catch (error) {
      return UserProfileResult.error(result.errorMessage ?? '');
    }
  }
}
