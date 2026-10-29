import '../models/coupon.dart';

const List<Coupon> sampleCoupons = [
  Coupon(
    code: 'FIRSTBUS',
    title: 'First Ride Special',
    description: 'Get 20% off up to ₹200 on your first booking',
    discountPercent: 20,
    maxDiscount: 200,
    minBookingAmount: 400,
  ),
  Coupon(
    code: 'BUSSAVE10',
    title: 'Smart Savings',
    description: 'Flat 10% instant discount on bookings above ₹600',
    discountPercent: 10,
    maxDiscount: 150,
    minBookingAmount: 600,
  ),
  Coupon(
    code: 'FESTIVE50',
    title: 'Festive Season Offer',
    description: 'Flat ₹150 off on weekend trips',
    discountPercent: 15,
    maxDiscount: 150,
    minBookingAmount: 800,
  ),
];
