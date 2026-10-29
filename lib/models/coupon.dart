class Coupon {
  final String code;
  final String title;
  final String description;
  final double discountPercent;
  final double maxDiscount;
  final double minBookingAmount;

  const Coupon({
    required this.code,
    required this.title,
    required this.description,
    required this.discountPercent,
    required this.maxDiscount,
    required this.minBookingAmount,
  });

  double calculateDiscount(double orderTotal) {
    if (orderTotal < minBookingAmount) return 0.0;
    final discount = (orderTotal * discountPercent) / 100;
    return discount > maxDiscount ? maxDiscount : discount;
  }
}
