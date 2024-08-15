import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../util/validator_email.dart';
import '../../util/validator_name.dart';
import '../../util/validator_password.dart';
import '../../util/validator_phone.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formGlobalKey = GlobalKey<FormState>();

  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(color: Colors.white, fontSize: 35),
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
                      key: _formGlobalKey,
                      child: Column(
                        children: [
                          const CustomTextField(
                              icon: Icons.email,
                              label: 'Email',
                              validator: emailValidator,
                              keyboardType: TextInputType.emailAddress),
                          const CustomTextField(
                              icon: Icons.person,
                              label: 'Nome',
                              validator: nameValidator,
                              keyboardType: TextInputType.text),
                          CustomTextField(
                              icon: Icons.phone,
                              label: 'Telefone',
                              inputFormatters: [phoneFormatter],
                              validator: phoneValidator,
                              keyboardType: TextInputType.phone),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Senha',
                            isSecret: true,
                            validator: passwordValidator,
                          ),
                          const CustomTextField(
                            icon: Icons.lock,
                            label: 'Confirme Senha',
                            isSecret: true,
                            validator: passwordValidator,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18))),
                                onPressed: () {
                                  _formGlobalKey.currentState?.validate();
                                },
                                child: const Text('Cadastrar usuário',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white))),
                          )
                        ],
                      ),
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
