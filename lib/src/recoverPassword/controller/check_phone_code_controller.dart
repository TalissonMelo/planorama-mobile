import 'package:get/get.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class CheckPhoneCodeController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> validCode({required String code, required String email}) async {
    isLoading.value = true;

    Get.offAllNamed(PagesRoutes.recoverPasswordRoute,
        parameters: {'code': code, 'email': email});

    isLoading.value = false;
  }
}
