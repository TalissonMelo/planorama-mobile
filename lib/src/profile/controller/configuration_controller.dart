import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/profile/model/configuration.dart';
import 'package:liberbox_mobile/src/profile/service/configuration_service.dart';
import 'package:liberbox_mobile/src/profile/service/result/user_password_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationController extends GetxController {
  RxBool isLoading = false.obs;

  final configurationService = ConfigurationService();
  final toast = CustomToast();

  Future<void> settings({
    required String timeZone,
    required String language,
  }) async {
    isLoading.value = true;

    UserPasswordResult result = await configurationService.execute(
      Configuration(
        timeZone: timeZone,
        language: language,
      ),
    );

    result.when(success: () async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selectedTimeZone', timeZone);
      await prefs.setString('selectedLanguage', language);

      toast.showToast(
          message: 'Configurações alteradas com sucesso.', isError: false);
    }, error: (message) {
      toast.showToast(message: message, isError: true);
    });

    isLoading.value = false;
  }
}
