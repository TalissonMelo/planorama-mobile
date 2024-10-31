import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

import '../../util/validator_email.dart';
import '../../util/validator_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    'title'.tr,
                    style: const TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      height: 1.2,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'login_title'.tr,
                    style: const TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "login_sub_title".tr,
                        style: const TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16,
                          fontWeight: FontWeight.w400, // Regular
                          height: 1.5,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(PagesRoutes.signUpRoute);
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          'criar_agora'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0369FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: emailController,
                          icon: Icons.email_outlined,
                          label: 'email'.tr,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          controller: passwordController,
                          icon: Icons.lock_outline,
                          label: 'senha'.tr,
                          isSecret: true,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(PagesRoutes.phoneCodeRoute);
                            },
                            child: Text(
                              'esqueci_senha'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF0369FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(
                            builder: (authController) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0369FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          authController.signIn(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : Text(
                                        'entrar_agora'.tr,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
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
