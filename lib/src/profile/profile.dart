import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/components/custom_text_field.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Perfil do usuário',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: const [
          CustomTextField(icon: Icons.email, label: "Email"),
          CustomTextField(icon: Icons.person, label: "Nome"),
          CustomTextField(icon: Icons.phone, label: "Telefone"),
        ],
      ),
    );
  }
}
