class CurrencyFormatter {
  static String format(double amount) {
    return '₹${amount.toStringAsFixed(amount.truncateToDouble() == amount ? 0 : 2)}';
  }

  static double calculateGst(double baseFare) {
    return baseFare * 0.05;
  }

  static double calculateTotal({
    required double baseFare,
    double discount = 0,
    double convenienceFee = 25,
  }) {
    final gst = calculateGst(baseFare);
    return (baseFare + gst + convenienceFee - discount).clamp(0, double.infinity);
  }
}
