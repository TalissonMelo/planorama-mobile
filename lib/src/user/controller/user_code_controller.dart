import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class UserCodeController extends GetxController {
  RxBool isLoading = false.obs;

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  final toast = CustomToast();

  Future<void> validCode({
    required String code,
    required String email,
  }) async {
    isLoading.value = true;
    final cognitoUser = CognitoUser(email, userPool);

    try {
      final result = await cognitoUser.confirmRegistration(code);

      if (result) {
        toast.showToast(
          message: 'Usuário confirmado com sucesso!',
          isError: false,
        );
        Get.offAllNamed(PagesRoutes.loginInRoute);
      } else {
        toast.showToast(
          message: 'Falha ao confirmar o usuário. Tente novamente.',
          isError: true,
        );
      }
    } catch (e) {
      toast.showToast(
        message: 'Erro: ${e.toString()}',
        isError: true,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
