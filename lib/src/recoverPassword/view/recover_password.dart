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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Redefinição de senha.',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(45))),
                    child: Form(
                      key: formRecoverPassword,
                      child: Column(
                        children: [
                          CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            controller: passwordController,
                            validator: passwordValidator,
                          ),
                          CustomTextField(
                            icon: Icons.lock,
                            label: 'Confirme Senha',
                            isSecret: true,
                            controller: passwordConfirmController,
                            validator: passwordValidator,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: recoverPasswordController
                                        .isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (formRecoverPassword.currentState!
                                            .validate()) {
                                          recoverPasswordController
                                              .changePassword(
                                                  code: widget.code,
                                                  email: widget.email,
                                                  password:
                                                      passwordController.text,
                                                  passwordConfirm:
                                                      passwordConfirmController
                                                          .text);
                                        }
                                      },
                                child: recoverPasswordController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text('Redefinir a senha',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
                          ),
                          const CustomReturnedLogin(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
