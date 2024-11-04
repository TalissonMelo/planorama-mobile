import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/profile/controller/configuration_controller.dart';
import 'package:liberbox_mobile/src/profile/controller/user_profile_controller.dart';
import 'package:liberbox_mobile/src/util/validator_phone.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../util/validator_name.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authController = Get.find<AuthController>();
  final userProfileController = UserProfileController();
  final configurationController = ConfigurationController();

  final formProfile = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final documentController = TextEditingController();

  List<String> timeZones = [];
  String selectedTimeZone = '';
  String selectedLanguage = '';

  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
    timeZones = tz.timeZoneDatabase.locations.keys.toList();

    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final phoneFormatter = MaskTextInputFormatter(
      mask: '## # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );

    final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: authController.signOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          Form(
            key: formProfile,
            child: Column(
              children: [
                CustomTextField(
                  icon: Icons.email_outlined,
                  label: "email".tr,
                  initialValue: authController.user.email,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.person_outline,
                  label: "apelido".tr,
                  initialValue: authController.user.nickname,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.person,
                  label: "nome".tr,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  validator: nameValidator,
                ),
                CustomTextField(
                  icon: Icons.phone_outlined,
                  label: "telefone".tr,
                  inputFormatters: [phoneFormatter],
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: phoneValidator,
                ),
                CustomTextField(
                  icon: Icons.file_copy,
                  label: "documento".tr,
                  controller: documentController,
                  inputFormatters: [cpfFormatter],
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.blue),
              ),
              onPressed:
                  userProfileController.isLoading.value ? null : _updateProfile,
              child: Text(
                'alterar_dados'.tr,
                style: const TextStyle(color: Colors.blue, fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: configuration,
              child: Text(
                'configuracao'.tr,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> configuration() async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'configuracao'.tr,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'timezone'.tr,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: selectedTimeZone.isNotEmpty ? selectedTimeZone : null,
                  hint: const Text('Selecione um Fuso Horário'),
                  items: timeZones.map((tz) {
                    return DropdownMenuItem(
                      value: tz,
                      child: Text(tz),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTimeZone = value ?? '';
                    });
                  },
                ),
                const SizedBox(height: 20),
                Text('DESCRIPTION'.tr, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedLanguage == 'en'
                            ? Colors.blue
                            : Colors.white,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => switchLanguage('en'),
                      child: Text(
                        'English',
                        style: TextStyle(
                          color: selectedLanguage == 'en'
                              ? Colors.white
                              : Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: selectedLanguage == 'pt'
                            ? Colors.blue
                            : Colors.white,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () => switchLanguage('pt'),
                      child: Text(
                        'Português',
                        style: TextStyle(
                          color: selectedLanguage == 'pt'
                              ? Colors.white
                              : Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: saveSettings,
                    child: Text(
                      'salvar_configuracoes'.tr,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void switchLanguage(String language) {
    setState(() {
      selectedLanguage = language;
      Get.updateLocale(Locale(language));
    });
  }

  Future<void> saveSettings() async {
    await configurationController.settings(
        timeZone: selectedTimeZone, language: selectedLanguage);
    Navigator.pop(context);
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTimeZone = prefs.getString('selectedTimeZone') ?? '';
      selectedLanguage = prefs.getString('selectedLanguage') ?? '';
      Get.updateLocale(Locale(selectedLanguage));
    });
  }

  void _updateProfile() {
    if (formProfile.currentState!.validate()) {
      userProfileController.changeProfile(
          phone: phoneController.text,
          name: nameController.text,
          document: documentController.text);
    }
  }
}
