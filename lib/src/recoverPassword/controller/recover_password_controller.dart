import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';
import 'package:liberbox_mobile/src/util/validator_two_password.dart';

class RecoverPasswordController extends GetxController {
  RxBool isLoading = false.obs;

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  final utilService = UtilService();
  final toast = CustomToast();

  Future<void> changePassword({
    required String code,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    if (passwordConfirmValidator(password, passwordConfirm)) {
      isLoading.value = true;

      try {
        final cognitoUser = CognitoUser(email, userPool);

        await cognitoUser.confirmPassword(
          code,
          password,
        );

        toast.showToast(
          message: 'Password changed successfully!',
          isError: false,
        );
        Get.offAllNamed(PagesRoutes.loginInRoute);
      } on CognitoClientException catch (e) {
        toast.showToast(
          message: 'Error: ${e.message ?? 'Failed to reset password.'}',
          isError: true,
        );
      } catch (e) {
        toast.showToast(
          message: 'An unexpected error has occurred. Please try again.',
          isError: true,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      toast.showToast(
        message: 'Passwords do not match. Please try again.',
        isError: true,
      );
    }
  }
}
