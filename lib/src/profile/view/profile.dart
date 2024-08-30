import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/profile/controller/user_password_controller.dart';
import 'package:liberbox_mobile/src/profile/controller/user_profile_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../util/validator_name.dart';
import '../../util/validator_password.dart';
import '../../util/validator_phone.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authController = Get.find<AuthController>();
  final userPasswordController = UserPasswordController();
  final userProfileController = UserProfileController();

  final formPassword = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final formProfile = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = authController.user.nickname ?? '';
    phoneController.text = authController.user.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final phoneFormatter = MaskTextInputFormatter(
        mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: const Text('Perfil do usuário',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
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
                  icon: Icons.email,
                  label: "Email",
                  initialValue: authController.user.email,
                  readOnly: true,
                ),
                CustomTextField(
                  icon: Icons.person,
                  label: "Nome",
                  validator: nameValidator,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                ),
                CustomTextField(
                    icon: Icons.phone,
                    label: "Telefone",
                    inputFormatters: [phoneFormatter],
                    validator: phoneValidator,
                    controller: phoneController,
                    keyboardType: TextInputType.phone),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                onPressed: userProfileController.isLoading.value
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();
                        if (formProfile.currentState!.validate()) {
                          userProfileController.changeProfile(
                              nickname: nameController.text,
                              phone: phoneController.text);
                        }
                      },
                child: const Text(
                  'Atualizar Perfil',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                )),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {
                  updatePassword();
                },
                child: const Text('Atualizar senha',
                    style: TextStyle(fontSize: 18, color: Colors.white))),
          )
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Form(
                  key: formPassword,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Atualização de senha',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        CustomTextField(
                          icon: Icons.lock,
                          label: 'Senha atual',
                          isSecret: true,
                          validator: passwordValidator,
                          controller: oldPasswordController,
                        ),
                        CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Nova senha',
                          isSecret: true,
                          validator: passwordValidator,
                          controller: newPasswordController,
                        ),
                        CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Confirmar senha',
                          isSecret: true,
                          validator: passwordValidator,
                          controller: passwordConfirmController,
                        ),
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: userPasswordController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (formPassword.currentState!
                                          .validate()) {
                                        userPasswordController.changePassword(
                                            oldPassword:
                                                oldPasswordController.text,
                                            newPassword:
                                                newPasswordController.text,
                                            passwordConfirm:
                                                passwordConfirmController.text);
                                      }
                                    },
                              child: userPasswordController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text('Atualizar',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white))),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
