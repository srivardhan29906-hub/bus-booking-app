import 'package:flutter/material.dart';
import '../models/coupon.dart';
import '../core/theme/app_colors.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final VoidCallback onApply;

  const CouponCard({super.key, required this.coupon, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(coupon.code, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
                Text(coupon.description, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              ],
            ),
          ),
          TextButton(
            onPressed: onApply,
            child: const Text('APPLY', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
