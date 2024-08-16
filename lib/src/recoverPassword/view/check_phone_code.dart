import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_returned_login.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/recoverPassword/controller/check_phone_code_controller.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckPhoneCode extends StatefulWidget {
  final String phoneNumber;

  const CheckPhoneCode({super.key, required this.phoneNumber});

  @override
  State<CheckPhoneCode> createState() => _CheckPhoneCodeState();
}

class _CheckPhoneCodeState extends State<CheckPhoneCode> {
  late String phoneNumber;

  final checkCodeFormKey = GlobalKey<FormState>();
  final checkPhoneCodeController = CheckPhoneCodeController();
  final codeController = TextEditingController();

  final customFormatterCode = MaskTextInputFormatter(
    mask: 'AAAAA',
    filter: {
      'A': RegExp(r'[A-Z0-9]'),
    },
  );

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
  }

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
                            'Verificação',
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Insira o código que foi enviado para o número $phoneNumber',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Form(
                      key: checkCodeFormKey,
                      child: Column(
                        children: [
                          CustomTextField(
                              icon: Icons.lock,
                              label: 'Código',
                              controller: codeController,
                              inputFormatters: [customFormatterCode],
                              keyboardType: TextInputType.emailAddress),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                              onPressed:
                                  checkPhoneCodeController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();
                                          if (checkCodeFormKey.currentState!
                                              .validate()) {
                                            checkPhoneCodeController.validCode(
                                              code: codeController.text,
                                            );
                                          }
                                        },
                              child: checkPhoneCodeController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Confirmar',
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
            ],
          ),
        ),
      ),
    );
  }
}
