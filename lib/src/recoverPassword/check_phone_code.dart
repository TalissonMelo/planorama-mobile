import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:liberbox_mobile/src/recoverPassword/recover_password.dart';

class CheckPhoneCode extends StatelessWidget {
  const CheckPhoneCode({super.key});

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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Insira o código que foi enviado para o número (34) 9 923*****',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
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
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(45))),
                          child: Column(
                            children: [
                              const CustomTextField(
                                  icon: Icons.lock, label: 'Código'),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18))),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (c) {
                                          return const RecoverPassword();
                                        }),
                                      );
                                    },
                                    child: const Text('Confirmar',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white))),
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
                ))));
  }
}
