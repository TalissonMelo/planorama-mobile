import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_returned_login.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/user/controller/sign_up_controller.dart';
import 'package:liberbox_mobile/src/user/view/terms.dart';

import '../../util/validator_email.dart';
import '../../util/validator_name.dart';
import '../../util/validator_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formGlobalKey = GlobalKey<FormState>();
  final signUpController = SignUpController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  bool acceptTerms = false; // Variable to track terms acceptance

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'crie_sua_conta'.tr,
                    style: const TextStyle(
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'criar_descricao'.tr,
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        icon: Icons.email,
                        label: 'email'.tr,
                        validator: emailValidator,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.person,
                        label: 'nome'.tr,
                        validator: nameValidator,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'senha'.tr,
                        isSecret: true,
                        controller: passwordController,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'confirmar_senha'.tr,
                        isSecret: true,
                        controller: passwordConfirmController,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: acceptTerms,
                            onChanged: (value) {
                              setState(() {
                                acceptTerms = value ?? false;
                              });
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const Terms());
                            },
                            child: Text(
                              '${'eu_aceito'.tr} ${'termos_de_uso'.tr}.',
                              style: const TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0369FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: (signUpController.isLoading.value ||
                                  !acceptTerms)
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();
                                  if (_formGlobalKey.currentState!.validate()) {
                                    signUpController.signUp(
                                      nickname: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      passwordConfirm:
                                          passwordConfirmController.text,
                                    );
                                  }
                                },
                          child: signUpController.isLoading.value
                              ? const CircularProgressIndicator()
                              : Text(
                                  'confirmar'.tr,
                                  style: const TextStyle(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
