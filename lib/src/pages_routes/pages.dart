import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/splash/splash.dart';
import 'package:liberbox_mobile/src/auth/view/sign_in_screen.dart';
import 'package:liberbox_mobile/src/auth/view/terms.dart';
import 'package:liberbox_mobile/src/chat/chat.dart';
import 'package:liberbox_mobile/src/initial/base.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/recoverPassword/view/check_phone_code.dart';
import 'package:liberbox_mobile/src/recoverPassword/view/recover_password.dart';
import 'package:liberbox_mobile/src/recoverPassword/view/send_phone_code.dart';
import 'package:liberbox_mobile/src/sessions/view/session_page.dart';
import 'package:liberbox_mobile/src/user/view/sign_up_screen.dart';
import 'package:liberbox_mobile/src/user/view/user_code.dart';

abstract class Pages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const Splash(),
    ),
    GetPage(
      name: PagesRoutes.loginInRoute,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const Base(),
    ),
    GetPage(
      name: PagesRoutes.phoneCodeRoute,
      page: () => const SendPhoneCode(),
    ),
    GetPage(
      name: PagesRoutes.checkPhoneCodeRoute,
      page: () => CheckPhoneCode(
        phoneNumber: Get.parameters['phoneNumber'] ?? '',
      ),
    ),
    GetPage(
      name: PagesRoutes.recoverPasswordRoute,
      page: () => RecoverPassword(
        code: Get.parameters['code'] ?? '',
        email: Get.parameters['email'] ?? '',
      ),
    ),
    GetPage(
      name: PagesRoutes.termsRoute,
      page: () => const Terms(),
    ),
    GetPage(
      name: PagesRoutes.sessionsRoute,
      page: () => SessionPage(
        scheduleId: Get.parameters['scheduleId'] ?? '',
      ),
    ),
    GetPage(
      name: PagesRoutes.chatRoute,
      page: () => Chat(
        sessionId: Get.parameters['sessionId'] ?? '',
        title: Get.parameters['title'] ?? '',
      ),
    ),
    GetPage(
      name: PagesRoutes.userCodeRoute,
      page: () => const UserCode(),
    ),
  ];
}
