import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/recover_email.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/result/send_phone_code_result.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/send_phone_code_service.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class SendPhoneCodeController extends GetxController {
  RxBool isLoading = false.obs;

  final sendPhoneCodeService = SendPhoneCodeService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> sendPhoneCode({required String email}) async {
    isLoading.value = true;

    SendCodePhoneResult result = await sendPhoneCodeService.execute(
      RecoverEmail(
        email: email,
      ),
    );

    result.when(success: (phoneNumber) {
      Get.offAllNamed(PagesRoutes.checkPhoneCodeRoute,
          parameters: {'phoneNumber': phoneNumber.phone});
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
