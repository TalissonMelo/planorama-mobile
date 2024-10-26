import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class SendPhoneCodeController extends GetxController {
  RxBool isLoading = false.obs;

  final utilService = UtilService();
  final toast = CustomToast();

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  Future<void> sendPhoneCode({required String email}) async {
    isLoading.value = true;

    try {
      final cognitoUser = CognitoUser(email, userPool);
      await cognitoUser.forgotPassword();

      Get.offAllNamed(
        PagesRoutes.checkPhoneCodeRoute,
        parameters: {'phoneNumber': email},
      );
      toast.showToast(
        message: 'Código de recuperação enviado para o e-mail.',
        isError: false,
      );
    } on CognitoClientException catch (e) {
      toast.showToast(
        message: e.message ?? 'Erro ao recuperar a senha.',
        isError: true,
      );
    } catch (e) {
      toast.showToast(
        message: 'Erro inesperado. Tente novamente.',
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
