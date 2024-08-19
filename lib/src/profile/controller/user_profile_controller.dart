import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
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

    isLoading.value = false;
  }
}
