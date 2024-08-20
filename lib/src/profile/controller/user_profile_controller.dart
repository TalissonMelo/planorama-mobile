import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/profile/model/user_profile_edit.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_profile_result.dart';
import 'package:liberbox_mobile/src/profile/service/user_profile_service.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;

  final userProfileService = UserProfileService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> changeProfile({
    required String nickname,
    required String phone,
  }) async {
    isLoading.value = true;

    UserProfileResult result = await userProfileService.execute(UserProfileEdit(
      nickname: nickname,
      phone: phone,
    ));

    result.when(success: (user) {
      toast.showToast(
          message: 'Usuário atualizado com sucesso!', isError: false);
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
