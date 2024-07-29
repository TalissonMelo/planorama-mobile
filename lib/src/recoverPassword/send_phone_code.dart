import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/recoverPassword/check_phone_code.dart';

class SendPhoneCode extends StatelessWidget {
  const SendPhoneCode({super.key});

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
                    child: Column(
                      children: [
                        const CustomTextField(
                            icon: Icons.email, label: 'Email'),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18))),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (c) {
                                    return CheckPhoneCode();
                                  }),
                                );
                              },
                              child: const Text('Continuar',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
