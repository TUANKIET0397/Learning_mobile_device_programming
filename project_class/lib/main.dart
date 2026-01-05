import 'package:flutter/material.dart';
import 'package:project_class/login_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material component widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(49, 66, 111, 135),
        ),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
