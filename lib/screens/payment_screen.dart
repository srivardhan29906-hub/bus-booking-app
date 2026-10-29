import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/custom_button.dart';

class PaymentScreen extends StatefulWidget {
  final double amount;
  final VoidCallback onPaymentComplete;

  const PaymentScreen({super.key, required this.amount, required this.onPaymentComplete});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedMethod = 'UPI';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount Payable: ₹${widget.amount.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            RadioListTile<String>(
              title: const Text('Google Pay / PhonePe / UPI'),
              value: 'UPI',
              groupValue: _selectedMethod,
              onChanged: (val) => setState(() => _selectedMethod = val!),
            ),
            RadioListTile<String>(
              title: const Text('Credit / Debit Card'),
              value: 'Card',
              groupValue: _selectedMethod,
              onChanged: (val) => setState(() => _selectedMethod = val!),
            ),
            const Spacer(),
            CustomButton(
              text: 'Pay Now',
              isLoading: _isLoading,
              onPressed: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(milliseconds: 1000), () {
                  widget.onPaymentComplete();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
