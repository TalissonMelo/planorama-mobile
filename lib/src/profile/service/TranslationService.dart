import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static const fallbackLocale = Locale('en');

  @override
  Map<String, Map<String, String>> get keys => {};

  Future<void> loadTranslations() async {
    final ptJson = await rootBundle.loadString('assets/i18n/pt.json');
    final enJson = await rootBundle.loadString('assets/i18n/en.json');

    Get.addTranslations({
      'pt': Map<String, String>.from(json.decode(ptJson)),
      'en': Map<String, String>.from(json.decode(enJson)),
    });
  }
}
