import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';
import 'package:liberbox_mobile/src/auth/service/validate_token_service.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/config/constants/storage_keys.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  UserLogin user = UserLogin();

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  final validateToken = ValidateTokenService();
  final utilService = UtilService();
  final toast = CustomToast();

  @override
  void onInit() {
    super.onInit();
    validToken();
  }

  void saveUserStorage() {
    utilService.saveLocalUser(key: StorageKeys.user, login: user);
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> validToken() async {
    await validateToken.validToken();
  }

  Future<CognitoUserSession?> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    final cognitoUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );

    try {
      final session = await cognitoUser.authenticateUser(authDetails);
      isLoading.value = false;

      if (session != null) {
        print('Login realizado com sucesso!');
        final payload = session.getIdToken().decodePayload();
        final email = payload['email'];
        final username = payload['cognito:username'];
        final name = payload['name'];

        user = UserLogin(
          id: username,
          email: email,
          nickname: name,
          accessToken: session.getIdToken().getJwtToken(),
          refreshToken: session.getRefreshToken()?.getToken() ?? '',
        );

        saveUserStorage();
        return session;
      } else {
        print('Sessão inválida.');
        return null;
      }
    } on CognitoClientException catch (e) {
      isLoading.value = false;
      if (e.code == 'UserNotFoundException') {
        print('Usuário não encontrado.');
      } else if (e.code == 'NotAuthorizedException') {
        print('Senha ou email incorretos.');
      } else {
        print('Erro de login: ${e.message}');
      }
      return null;
    } catch (e) {
      isLoading.value = false;
      print('Erro inesperado: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    user = UserLogin();

    await utilService.removeLocalData(key: StorageKeys.user);
    Get.offAllNamed(PagesRoutes.loginInRoute);
  }
}
