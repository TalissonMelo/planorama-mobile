import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/sign_in_screen.dart';
import 'package:liberbox_mobile/src/initial/base.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/recoverPassword/check_phone_code.dart';
import 'package:liberbox_mobile/src/recoverPassword/recover_password.dart';
import 'package:liberbox_mobile/src/recoverPassword/send_phone_code.dart';
import 'package:liberbox_mobile/src/splash/splash.dart';
import 'package:liberbox_mobile/src/user/sign_up_screen.dart';

abstract class Pages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const Splash(),
    ),
    GetPage(
      name: PagesRoutes.loginInRoute,
      page: () => SignInScreen(),
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
      page: () => const CheckPhoneCode(),
    ),
    GetPage(
      name: PagesRoutes.recoverPasswordRoute,
      page: () => const RecoverPassword(),
    )
  ];
}
