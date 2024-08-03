import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/sign_in_screen.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
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
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => const SignUpScreen(),
    )
  ];
}
