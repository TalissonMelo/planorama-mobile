import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/initial/base.dart';
import 'package:liberbox_mobile/src/recoverPassword/send_phone_code.dart';
import 'package:liberbox_mobile/src/user/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomTextField(
                    icon: Icons.email,
                    label: 'Email',
                  ),
                  const CustomTextField(
                    icon: Icons.lock,
                    label: 'Senha',
                    isSecret: true,
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return const Base();
                            }),
                          );
                        },
                        child: const Text('Entrar',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white))),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return const SendPhoneCode();
                            }),
                          );
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
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (c) {
                              return const SignUpScreen();
                            }),
                          );
                        },
                        child: const Text(
                          'Criar conta',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
