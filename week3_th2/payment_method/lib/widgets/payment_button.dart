import 'package:flutter/material.dart';
import '../models/payment_method.dart';

class PaymentButton extends StatelessWidget {
  final PaymentMethod method;
  final String? selectedMethod;
  final VoidCallback onTap;

  const PaymentButton({
    super.key,
    required this.method,
    required this.selectedMethod,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        shadowColor: colorScheme.primary,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                selectedMethod == method.id
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                method.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(method.asset, width: 89, height: 28),
          ),
        ],
      ),
    );
  }
}
