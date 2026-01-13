import 'package:flutter/material.dart';
import 'package:week5_th2/UI/password_screen.dart';
import 'package:week5_th2/models/reset_account_data.dart';

class OtpScreen extends StatefulWidget {
  final ResetAccountData data;
  const OtpScreen({super.key, required this.data});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String _otp = '';

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
              'Verify Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the the code \n we just sent you on your registered Email',
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            /// 🔥 OTP INPUT
            OtpInput(
              onCompleted: (value) {
                _otp = value;
              },
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
              onPressed: () async {
                if (_otp.length != 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng nhập đủ OTP')),
                  );
                  return;
                }

                widget.data.otp = _otp;

                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PasswordScreen(data: widget.data),
                  ),
                );

                if (result != null) {
                  Navigator.pop(context, result);
                }
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
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

class OtpInput extends StatefulWidget {
  final void Function(String otp)? onCompleted;
  const OtpInput({super.key, this.onCompleted});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final controllers = List.generate(5, (_) => TextEditingController());
  final focusNodes = List.generate(5, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (final node in focusNodes) {
      node.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        final isFocused = focusNodes[index].hasFocus;

        return SizedBox(
          width: 45,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: isFocused
                  ? Colors.white
                  : const Color.fromARGB(135, 158, 158, 158),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isFocused ? Colors.black : Colors.grey,
            ),
            onChanged: (value) {
              if (value.isNotEmpty && index < 4) {
                FocusScope.of(context).nextFocus();
              }
              _checkOtp();
            },
          ),
        );
      }),
    );
  }

  void _checkOtp() {
    final otp = controllers.map((e) => e.text).join();
    if (otp.length == 5) {
      widget.onCompleted?.call(otp);
    }
  }
}
