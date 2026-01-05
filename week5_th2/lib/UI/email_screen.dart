import 'package:flutter/material.dart';
import 'package:week5_th2/UI/otp_screen.dart';
import 'package:week5_th2/models/reset_account_data.dart';

/// ================= SCREEN 1 =================
class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final controller = TextEditingController();
  final List<ResetAccountData> accounts = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(' ')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset('assets/img.png', height: 120, width: 120),
              const SizedBox(height: 2),
              Text(
                'SmartTasks',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                title: Center(
                  child: Text(
                    'Forget Password',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'Enter your Email, we will send you a verification code',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  // hintText: 'Your Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email không được để trống';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );

                  if (!emailRegex.hasMatch(value)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: () async {
                  final email = controller.text.trim();

                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  final formValid = _formKey.currentState!.validate();

                  if (email.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email không được để trống'),
                      ),
                    );
                    return;
                  }

                  if (!emailRegex.hasMatch(email)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email không hợp lệ')),
                    );
                    return;
                  }

                  final data = ResetAccountData(email: email);

                  if (!formValid) return;
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => OtpScreen(data: data)),
                  );

                  if (result != null) {
                    setState(() {
                      accounts.add(result);
                      controller.clear();
                    });
                  }
                },
                child: const Text('Next'),
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView.builder(
                  itemCount: accounts.length,
                  itemBuilder: (_, index) {
                    final item = accounts[index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: Text(item.email ?? ''),
                        subtitle: Text(
                          'OTP: ${item.otp}, Pass: ${item.newPassword}',
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
