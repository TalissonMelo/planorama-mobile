import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liberbox_mobile/src/pages_routes/entity/pages_routes.dart';

class CustomReturnedLogin extends StatelessWidget {
  const CustomReturnedLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: () {
              Get.offNamed(PagesRoutes.loginInRoute);
            },
            child: const Text(
              'Voltar a tela de login?',
              style: TextStyle(color: Colors.blue),
            )),
      ),
    );
  }
}
