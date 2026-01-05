import 'package:flutter/material.dart';
import 'package:week4/list_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Header: tên + số
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Lê Tuấn Kiệt',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '082205007910',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Logo
              Image.asset('assets/logo/logo.png', width: 216, height: 233),

              const SizedBox(height: 56),

              // Tiêu đề + mô tả
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Material component widgets',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'A catalog of Flutter\'s material component widgets. Visual, behavioral, and motion-rich widgets implementing the Material 3 design specification.',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(), // đẩy nút xuống cuối màn hình
              // Nút chuyển trang
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ListScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
                  minimumSize: const Size(315, 52),
                  elevation: 4,
                ),
                child: const Text(
                  'I\'m ready',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
