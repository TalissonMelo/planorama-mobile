import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

import '../../util/validator_two_password.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  final utilService = UtilService();
  final toast = CustomToast();

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  Future<void> signUp({
    required String nickname,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    if (passwordConfirmValidator(password, passwordConfirm)) {
      try {
        final attributes = [
          AttributeArg(name: 'email', value: email),
          AttributeArg(name: 'name', value: nickname),
        ];

        final result = await userPool.signUp(
          email,
          password,
          userAttributes: attributes,
        );

        if (result.userConfirmed ?? false) {
          toast.showToast(
            message: 'Usuário já confirmado! Faça login.',
            isError: false,
          );
          Get.offAllNamed(PagesRoutes.loginInRoute);
        } else {
          toast.showToast(
            message: 'Usuário cadastrado! Verifique seu e-mail para confirmar.',
            isError: false,
          );
          Get.offAllNamed(PagesRoutes.userCodeRoute, parameters: {
            'email': email,
          });
        }
      } catch (e) {
        toast.showToast(
          message: 'Erro ao cadastrar: ${e.toString()}',
          isError: true,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      toast.showToast(
          message: 'Senhas não conferem. Por favor, tente novamente.',
          isError: true);
    }
  }
}
