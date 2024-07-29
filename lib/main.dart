import 'package:flutter/material.dart';
import 'package:liberbox_mobile/src/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'liberbox',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SignInScreen(),
    );
  }
}
