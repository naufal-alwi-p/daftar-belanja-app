import 'package:flutter/material.dart';
import 'package:daftar_belanja/view/login_as.dart';
import 'package:daftar_belanja/view/login_and_register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginAs(),
        '/login-or-register': (context) => const LoginOrRegister(),
      },
    );
  }
}
