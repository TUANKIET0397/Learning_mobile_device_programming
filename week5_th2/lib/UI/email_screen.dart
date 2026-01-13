import 'package:flutter/material.dart';
import 'package:week5_th2/UI/otp_screen.dart';
import 'package:week5_th2/models/reset_account_data.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  late TextEditingController emailController;
  final List<ResetAccountData> accounts = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
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

              const SizedBox(height: 12),

              const Text(
                'Forget Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                'Enter your email, we will send you a verification code',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Your Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: _emailValidator,
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: _onNextPressed,
                child: const Text('Next'),
              ),

              const SizedBox(height: 24),

              Expanded(child: _buildAccountList()),
            ],
          ),
        ),
      ),
    );
  }

  void _onNextPressed() async {
    if (!formKey.currentState!.validate()) return;

    final data = ResetAccountData(email: emailController.text.trim());

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OtpScreen(data: data)),
    );

    if (result != null) {
      setState(() {
        accounts.add(result);
        emailController.clear();
      });
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email không được để trống';
    }

    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!regex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }

    return null;
  }

  Widget _buildAccountList() {
    return ListView.builder(
      itemCount: accounts.length,
      itemBuilder: (_, index) {
        final item = accounts[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.account_circle),
            title: Text(item.email ?? ''),
            subtitle: Text('OTP: ${item.otp}, Pass: ${item.newPassword}'),
          ),
        );
      },
    );
  }
}
