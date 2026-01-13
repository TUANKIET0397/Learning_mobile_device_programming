import 'dart:async';
import 'package:flutter/material.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Chạy splash trong 2 giây
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Logo UTH
            Image.asset('assets/logo.png', height: 90),
            const SizedBox(height: 16),

            /// App name
            const Text(
              'UTH SmartTasks',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Timer(..., () async {
//   final seen = await checkOnboardingSeen();

//   if (!mounted) return;

//   if (seen) {
//     goToLogin();
//   } else {
//     goToOnboarding();
//   }
// });
