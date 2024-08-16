import 'package:flutter/material.dart';
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
                            'Para recuperar sua senha, digite o email cadastrado no Liberbox.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                      key: sendFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              icon: Icons.email,
                              label: 'Email',
                              validator: emailValidator,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: sendPhoneCodeController.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (sendFormKey.currentState!
                                          .validate()) {
                                        sendPhoneCodeController.sendPhoneCode(
                                          email: emailController.text,
                                        );
                                      }
                                    },
                              child: sendPhoneCodeController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Continuar',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
