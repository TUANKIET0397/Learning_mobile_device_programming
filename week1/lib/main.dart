import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header with back button and edit button
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.arrow_back, size: 20),
                      onPressed: () {},
                    ),
                  ),
                  // Edit button
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 20,
                        color: Colors.green,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            // Spacer để đẩy nội dung xuống giữa
            const Spacer(),

            // Profile avatar
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlue.shade100,
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://mockmind-api.uifaces.co/content/human/80.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Name
            const Text(
              'Tuấn Kiệt',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            // Location
            Text(
              'Ho Chi Minh City, Vietnamese',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),

            // Spacer để đẩy nội dung lên giữa
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
