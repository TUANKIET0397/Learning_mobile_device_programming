import 'package:flutter/material.dart';
import '../models/payment_method.dart';
import '../widgets/payment_button.dart';

class PaymentAppPage extends StatefulWidget {
  const PaymentAppPage({super.key});

  @override
  State<PaymentAppPage> createState() => _PaymentAppPageState();
}

class _PaymentAppPageState extends State<PaymentAppPage> {
  final List<PaymentMethod> methods = const [
    PaymentMethod(id: 'paypal', name: 'Paypal', asset: 'assets/paypal.png'),
    PaymentMethod(
      id: 'googlepay',
      name: 'GooglePay',
      asset: 'assets/googlePay.png',
    ),
    PaymentMethod(
      id: 'applepay',
      name: 'ApplePay',
      asset: 'assets/applePay.png',
    ),
  ];

  String currentImage = 'assets/default.png';
  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(child: Center(child: Image.asset(currentImage))),
            const Divider(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    ...methods.map(
                      (m) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: PaymentButton(
                          method: m,
                          selectedMethod: selectedMethod,
                          onTap: () {
                            setState(() {
                              selectedMethod = m.id;
                              currentImage = m.asset;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Nút Continue chỉ hiện khi đã chọn phương thức
                    if (selectedMethod != null)
                      ElevatedButton(
                        onPressed: () {
                          // Ví dụ: xử lý tiếp tục thanh toán
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Continue with $selectedMethod'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          elevation: 8,
                          shadowColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 130,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
