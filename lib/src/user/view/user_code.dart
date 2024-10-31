import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/components/custom_toast.dart';
import 'package:liberbox_mobile/src/user/controller/user_code_controller.dart';

class UserCode extends StatefulWidget {
  final String email;
  const UserCode({super.key, required this.email});

  @override
  State<UserCode> createState() => _UserCodeState();
}

class _UserCodeState extends State<UserCode> {
  final toast = CustomToast();
  final checkCodeFormKey = GlobalKey<FormState>();

  final userCodeController = UserCodeController();

  final List<TextEditingController> codeControllers =
      List.generate(6, (index) => TextEditingController());

  final List<FocusNode> codeFocusNodes =
      List.generate(6, (index) => FocusNode());

  late String email;

  @override
  void initState() {
    super.initState();
    email = widget.email;
  }

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
                    'verificacao'.tr,
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
                    '${'insira_codigo'.tr} $email',
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
                  key: checkCodeFormKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return Container(
                        width: 40,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: TextFormField(
                          controller: codeControllers[index],
                          focusNode: codeFocusNodes[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.characters,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                index < codeControllers.length - 1) {
                              FocusScope.of(context)
                                  .requestFocus(codeFocusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context)
                                  .requestFocus(codeFocusNodes[index - 1]);
                            }
                          },
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      toast.showToast(
                        message: 'Confirmation code sent again!',
                        isError: false,
                      );
                    },
                    child: Text(
                      'reenviar_codigo'.tr,
                      style: const TextStyle(
                        color: Color(0xFF0369FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0369FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      minimumSize: const Size(
                        0,
                        50,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),
                    onPressed: userCodeController.isLoading.value
                        ? null
                        : () {
                            FocusScope.of(context).unfocus();
                            if (checkCodeFormKey.currentState!.validate()) {
                              String code = codeControllers
                                  .map((controller) => controller.text)
                                  .join();
                              userCodeController.validCode(
                                code: code,
                                email: email,
                              );
                            }
                          },
                    child: userCodeController.isLoading.value
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
