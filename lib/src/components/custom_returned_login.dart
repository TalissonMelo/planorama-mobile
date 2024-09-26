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
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              Get.offNamed(PagesRoutes.loginInRoute);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0369FF),
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }
}
