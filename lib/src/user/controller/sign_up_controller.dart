import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/user/domain/user_request.dart';
import 'package:liberbox_mobile/src/user/service/result/sign_up_result.dart';
import 'package:liberbox_mobile/src/user/service/sign_up_service.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

import '../../util/validator_two_password.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  final signUpService = SignUpService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> signUp({
    required String nickname,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    if (passwordConfirmValidator(password, passwordConfirm)) {
      isLoading.value = true;

      SignUpResult result = await signUpService.execute(
        UserRequest(
          email: email,
          nickname: nickname,
          phone: phone,
          password: utilService.encodePassword(password),
        ),
      );

      result.when(success: (user) {
        toast.showToast(
            message: 'Cadastro realizado com sucesso!.', isError: false);
        Get.offAllNamed(PagesRoutes.loginInRoute);
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
