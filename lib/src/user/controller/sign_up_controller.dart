import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/user/domain/user_request.dart';
import 'package:liberbox_mobile/src/user/service/result/sign_up_result.dart';
import 'package:liberbox_mobile/src/user/service/sign_up_service.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  UserRequest user = UserRequest();

  final signUpService = SignUpService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> signUp({
    required String nickname,
    required String phone,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    SignUpResult result = await signUpService.execute(UserRequest(
        email: email, nickname: nickname, phone: phone, password: password));

    result.when(success: (user) {
      toast.showToast(
          message: 'Cadastro realizado com sucesso!.', isError: false);
      Get.offAllNamed(PagesRoutes.loginInRoute);
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
