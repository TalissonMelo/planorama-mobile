import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';
import 'package:liberbox_mobile/src/pages_routes/pages.dart';
import 'package:liberbox_mobile/src/profile/service/TranslationService.dart';
import 'package:liberbox_mobile/src/profile/service/list_configuration_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  Get.put(AuthController());

  Get.lazyPut(() => ListConfigurationService());

  final translationService = TranslationService();
  await translationService.loadTranslations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Planorama',
      translations: TranslationService(),
      locale: Get.deviceLocale ?? const Locale('en'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0369FF),
        ).copyWith(
          primary: const Color(0xFF0369FF),
          secondary: const Color(0xFF0369FF),
          surfaceTint: const Color(0xFF0369FF),
        ),
      ),
      initialRoute: PagesRoutes.splashRoute,
      getPages: Pages.pages,
    );
  }
}
