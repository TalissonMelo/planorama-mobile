import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/profile/model/user_password_change.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_password_result.dart';
import 'package:liberbox_mobile/src/profile/service/user_password_service.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';
import 'package:liberbox_mobile/src/util/validator_two_password.dart';

class UserPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final userPasswordService = UserPasswordService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String passwordConfirm,
  }) async {
    if (passwordConfirmValidator(newPassword, passwordConfirm)) {
      isLoading.value = true;

      UserPasswordResult result = await userPasswordService.execute(
        UserPasswordChange(
          newPassword: utilService.encodePassword(newPassword),
          oldPassword: utilService.encodePassword(oldPassword),
        ),
      );

      result.when(success: () {
        Get.offAllNamed(PagesRoutes.loginInRoute);
        toast.showToast(
            message: 'Senha modificada com sucesso. Efetue login novamente.',
            isError: false);
      }, error: (message) {
        toast.showToast(message: message, isError: true);
      });

      isLoading.value = false;
    } else {
      toast.showToast(
          message: 'Senhas não conferem. Por favor, tente novamente.',
          isError: true);
    }
  }
}
