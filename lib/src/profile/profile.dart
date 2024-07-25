import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/auth/sign_in_screen.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneFormatter = MaskTextInputFormatter(
        mask: '## # ####-####', filter: {'#': RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Perfil do usuário',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (c) {
                  return const SignInScreen();
                }),
              );
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            icon: Icons.email,
            label: "Email",
            readOnly: true,
          ),
          CustomTextField(icon: Icons.person, label: "Nome"),
          CustomTextField(
            icon: Icons.phone,
            label: "Telefone",
            inputFormatters: [phoneFormatter],
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Atualizar Perfil',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
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
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18))),
                onPressed: () {},
                child: const Text('Atualizar senha',
                    style: TextStyle(fontSize: 18, color: Colors.white))),
          )
        ],
      ),
    );
  }
}
