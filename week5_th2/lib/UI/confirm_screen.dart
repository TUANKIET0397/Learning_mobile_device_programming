import 'package:flutter/material.dart';
import 'package:week5_th2/models/reset_account_data.dart';

/// ================= SCREEN 4 =================
class ConfirmScreen extends StatelessWidget {
  final ResetAccountData data;
  const ConfirmScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildBackButton(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img.png', height: 120),
            const SizedBox(height: 8),

            const Text(
              'SmartTasks',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Confirm',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('We are here to help you!', textAlign: TextAlign.center),

            const SizedBox(height: 24),

            /// 🔒 INFO CARD
            _InfoTile(icon: Icons.email_outlined, value: data.email ?? ''),
            const SizedBox(height: 12),
            _InfoTile(icon: Icons.verified_outlined, value: data.otp ?? ''),
            const SizedBox(height: 12),
            _InfoTile(
              icon: Icons.lock_outline,
              value: maskPassword(data.newPassword),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onPressed: () {
                /// 🔥 POP 1 LẦN – bubble data ngược về màn đầu
                Navigator.pop(context, data);
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }

  String maskPassword(String? password) {
    if (password == null || password.isEmpty) return '';
    return '•' * password.length;
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.only(left: 10),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
    );
  }
}

/// ================= REUSABLE INFO TILE =================
class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String value;

  const _InfoTile({required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(132, 158, 158, 158),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
