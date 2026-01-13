import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                user?.photoURL ?? "https://via.placeholder.com/150",
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              initialValue: user?.displayName ?? "",
              decoration: const InputDecoration(labelText: "Name"),
              readOnly: true,
            ),

            const SizedBox(height: 12),

            TextFormField(
              initialValue: user?.email ?? "",
              decoration: const InputDecoration(labelText: "Email"),
              readOnly: true,
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
