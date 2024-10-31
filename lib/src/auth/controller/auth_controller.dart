import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/model/user_login.dart';
import 'package:liberbox_mobile/src/auth/service/validate_token_service.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/config/constants/storage_keys.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';
import 'package:liberbox_mobile/src/profile/service/list_configuration_service.dart';
import 'package:liberbox_mobile/src/profile/service/result/configuration_result.dart';
import 'package:liberbox_mobile/src/util/util_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  UserLogin user = UserLogin();
  Configuration? configuration;

  final userPool = CognitoUserPool(
    dotenv.env['COGNITO_USER_POOL_ID'] ?? '',
    dotenv.env['COGNITO_CLIENT_ID'] ?? '',
  );

  final validateToken = ValidateTokenService();
  final configurationService = ListConfigurationService();
  final utilService = UtilService();
  final toast = CustomToast();

  @override
  void onInit() {
    super.onInit();
    validToken();
  }

  void saveUserStorage() async {
    await utilService.saveLocalUser(key: StorageKeys.user, login: user);

    ConfigurationResult result =
        await configurationService.execute(user.id!, user.accessToken!);

    result.when(
        success: (response) async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('selectedTimeZone', response.timeZone ?? '');
          await prefs.setString('selectedLanguage', response.language ?? '');

          await utilService.settings(
            key: StorageKeys.settings,
            configuration: response,
          );
        },
        error: (message) {});

    isLoading.value = false;
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

      if (session != null) {
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
        errorSignIn();
        return null;
      }
    } on CognitoClientException catch (e) {
      errorSignIn();
      return null;
    } catch (e) {
      errorSignIn();
      return null;
    }
  }

  void errorSignIn() {
    toast.showToast(message: 'Incorrect email or password.', isError: true);
    isLoading.value = false;
  }

  Future<void> signOut() async {
    user = UserLogin();
    await utilService.removeLocalData(key: StorageKeys.user);
    Get.offAllNamed(PagesRoutes.loginInRoute);
  }
}
