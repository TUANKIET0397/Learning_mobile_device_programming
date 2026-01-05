import 'package:flutter/material.dart';

class PasswordFieldPage extends StatefulWidget {
  const PasswordFieldPage({super.key});

  @override
  State<PasswordFieldPage> createState() => _PasswordFieldPageState();
}

class _PasswordFieldPageState extends State<PasswordFieldPage> {
  bool _obscureText = true; // trạng thái ẩn/hiện mật khẩu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Password Field Components Demo'),
        foregroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Basic PasswordField:'),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),

            const Text('PasswordField with validation (TextFormField):'),
            Form(
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 20),

            const Text('PasswordField with toggle show/hide:'),
            TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text('Styled PasswordField:'),
            const TextField(
              obscureText: true,
              style: TextStyle(color: Colors.blue, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Styled Password',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
