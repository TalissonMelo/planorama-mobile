import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_returned_login.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/recoverPassword/controller/send_phone_code_controller.dart';

import '../../util/validator_email.dart';

class SendPhoneCode extends StatefulWidget {
  const SendPhoneCode({super.key});

  @override
  State<SendPhoneCode> createState() => _SendPhoneCodeState();
}

class _SendPhoneCodeState extends State<SendPhoneCode> {
  final sendFormKey = GlobalKey<FormState>();
  final sendPhoneCodeController = SendPhoneCodeController();
  final emailController = TextEditingController();

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
                    'recuperar_senha'.tr,
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
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'email_associado'.tr,
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(45)),
                  ),
                  child: Form(
                    key: sendFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Campo de Email
                        CustomTextField(
                          icon: Icons.email_outlined,
                          label: 'email'.tr,
                          validator: emailValidator,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
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
                            onPressed: sendPhoneCodeController.isLoading.value
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    if (sendFormKey.currentState!.validate()) {
                                      sendPhoneCodeController.sendPhoneCode(
                                        email: emailController.text,
                                      );
                                    }
                                  },
                            child: sendPhoneCodeController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Text(
                                    'continuar'.tr,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
