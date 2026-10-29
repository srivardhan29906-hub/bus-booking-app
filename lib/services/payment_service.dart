class PaymentResult {
  final bool isSuccess;
  final String transactionId;
  final String? errorMessage;

  PaymentResult({required this.isSuccess, required this.transactionId, this.errorMessage});
}

class PaymentService {
  static Future<PaymentResult> processPayment({
    required double amount,
    required String paymentMethod,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return PaymentResult(
      isSuccess: true,
      transactionId: 'TXN${DateTime.now().millisecondsSinceEpoch}',
    );
  }
}
