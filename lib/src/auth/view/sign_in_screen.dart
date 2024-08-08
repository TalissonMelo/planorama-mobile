import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/auth/controller/auth_controller.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(45))),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      label: 'Email',
                      validator: (email) {
                        if (email == null || email.isEmpty)
                          return 'Digite seu melhor email!';

                        if (!email.isEmail) return 'Digite um email válido!';

                        return null;
                      },
                    ),
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                      validator: (password) {
                        if (password == null || password.isEmpty)
                          return 'Digite sua senha.';

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                      child: GetX<AuthController>(
                        builder: (authController) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: authController.isLoading.value
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      authController.signIn(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                            child: authController.isLoading.value
                                ? const CircularProgressIndicator()
                                : const Text(
                                    'Entrar',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed(PagesRoutes.phoneCodeRoute);
                          },
                          child: const Text(
                            'Esqueceu a senha?',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Divider(
                          color: Colors.grey.withAlpha(90),
                          thickness: 2,
                        )),
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 2,
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(PagesRoutes.signUpRoute);
                        },
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
