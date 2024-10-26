import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_returned_login.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/user/controller/sign_up_controller.dart';

import '../../util/validator_email.dart';
import '../../util/validator_name.dart';
import '../../util/validator_password.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  final signUpController = SignUpController();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
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
                    'Crie sua conta',
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
                    'Preencha os campos para criar sua conta.',
                    style: TextStyle(
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
                        label: 'Email',
                        validator: emailValidator,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.person,
                        label: 'Nome',
                        validator: nameValidator,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        controller: passwordController,
                        validator: passwordValidator,
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        icon: Icons.lock,
                        label: 'Confirme Senha',
                        isSecret: true,
                        controller: passwordConfirmController,
                        validator: (value) {
                          if (value != passwordController.text) {
                            return 'As senhas não coincidem.';
                          }
                          return null;
                        },
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
                          onPressed: signUpController.isLoading.value
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
                              : const Text(
                                  'Cadastrar usuário',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
