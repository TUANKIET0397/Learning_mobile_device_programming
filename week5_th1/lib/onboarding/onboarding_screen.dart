import 'package:flutter/material.dart';
import 'onboarding_data.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex < onboardingList.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // TODO: Navigate to Login / Home
    }
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentIndex == onboardingList.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Top indicator + Skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      onboardingList.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Colors.blue
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'skip',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),

            /// PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(data: onboardingList[index]);
                },
              ),
            ),

            const SizedBox(height: 24),

            /// Bottom buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      if (_currentIndex > 0)
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            onPressed: _prevPage,
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      if (_currentIndex > 0) const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            child: Text(
                              isLastPage ? 'Get Started' : 'Next',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
