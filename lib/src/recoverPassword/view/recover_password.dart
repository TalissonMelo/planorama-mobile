import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_returned_login.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/recoverPassword/controller/recover_password_controller.dart';

import '../../util/validator_password.dart';

class RecoverPassword extends StatefulWidget {
  final String code;
  final String email;

  const RecoverPassword({super.key, required this.code, required this.email});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final formRecoverPassword = GlobalKey<FormState>();
  final recoverPasswordController = RecoverPasswordController();

  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/images/logo_planorama.png',
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Redefinição de senha',
                    style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Por favor, insira e confirme sua nova senha abaixo.',
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Form(
                    key: formRecoverPassword,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Senha',
                          isSecret: true,
                          controller: passwordController,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          icon: Icons.lock_outline,
                          label: 'Confirme Senha',
                          isSecret: true,
                          controller: passwordConfirmController,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0369FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            onPressed: recoverPasswordController.isLoading.value
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    if (formRecoverPassword.currentState!
                                        .validate()) {
                                      recoverPasswordController.changePassword(
                                        code: widget.code,
                                        email: widget.email,
                                        password: passwordController.text,
                                        passwordConfirm:
                                            passwordConfirmController.text,
                                      );
                                    }
                                  },
                            child: recoverPasswordController.isLoading.value
                                ? const CircularProgressIndicator()
                                : const Text(
                                    'Redefinir a senha',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                        const CustomReturnedLogin(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
