import 'package:flutter/material.dart';
import 'package:week5_th2/UI/confirm_screen.dart';
import 'package:week5_th2/models/reset_account_data.dart';

/// ================= SCREEN 3 =================
class PasswordScreen extends StatefulWidget {
  final ResetAccountData data;

  const PasswordScreen({super.key, required this.data});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late TextEditingController pass1;
  late TextEditingController pass2;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    /// 🔥 load lại password nếu đã nhập trước đó
    pass1 = TextEditingController(text: widget.data.newPassword ?? '');
    pass2 = TextEditingController(text: widget.data.newPassword ?? '');
  }

  @override
  void dispose() {
    pass1.dispose();
    pass2.dispose();
    super.dispose();
  }

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

              const SizedBox(height: 16),

              const Text(
                'Create New Password',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                'Your new password must be different from previously used password',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              /// PASSWORD
              TextFormField(
                controller: pass1,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                validator: _passwordValidator,
              ),

              const SizedBox(height: 12),

              /// CONFIRM PASSWORD
              TextFormField(
                controller: pass2,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
                validator: _passwordValidator,
              ),

              const SizedBox(height: 24),

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
            ],
          ),
        ),
      ),
    );
  }

  /// ================= LOGIC =================
  void _onNextPressed() async {
    if (!formKey.currentState!.validate()) return;

    if (pass1.text != pass2.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password không khớp')));
      return;
    }

    /// 🔥 lưu password vào data
    widget.data.newPassword = pass1.text;

    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ConfirmScreen(data: widget.data)),
    );

    /// 🔥 bubble data về màn trước
    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  /// ================= VALIDATOR =================
  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password không được để trống';
    }

    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

    if (!regex.hasMatch(value)) {
      return '≥8 ký tự, gồm chữ hoa, chữ thường và số';
    }
    return null;
  }

  /// ================= UI =================
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
