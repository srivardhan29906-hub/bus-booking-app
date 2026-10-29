import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int? reviewsCount;

  const RatingBadge({super.key, required this.rating, this.reviewsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, size: 14, color: AppColors.success),
          const SizedBox(width: 3),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.success),
          ),
          if (reviewsCount != null) ...[
            const SizedBox(width: 4),
            Text('($reviewsCount)', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ]
        ],
      ),
    );
  }
}
