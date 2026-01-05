import 'package:flutter/material.dart';
import 'package:week4/login_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material component widgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
