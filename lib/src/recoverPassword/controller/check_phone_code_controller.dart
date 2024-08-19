import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/recoverPassword/domain/code_request.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/check_phone_code_service.dart';
import 'package:liberbox_mobile/src/recoverPassword/service/result/check_phone_code_result.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class CheckPhoneCodeController extends GetxController {
  RxBool isLoading = false.obs;

  final checkPhoneCodeService = CheckPhoneCodeService();
  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> validCode({required String code}) async {
    isLoading.value = true;

    CheckPhoneCodeResult result = await checkPhoneCodeService.execute(
      CodeRequest(
        code: code,
      ),
    );

    result.when(success: (code) {
      Get.offAllNamed(PagesRoutes.recoverPasswordRoute,
          parameters: {'code': code.newCode, 'email': code.email});
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
