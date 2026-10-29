import 'package:flutter/material.dart';
import '../models/bus.dart';
import '../core/theme/app_colors.dart';
import 'rating_badge.dart';
import 'amenity_chip.dart';

class BusCard extends StatelessWidget {
  final Bus bus;
  final VoidCallback onTap;

  const BusCard({super.key, required this.bus, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFFEAECF0)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      bus.operatorName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  RatingBadge(rating: bus.rating, reviewsCount: bus.totalReviews),
                ],
              ),
              const SizedBox(height: 4),
              Text(bus.busType, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(bus.departure, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(bus.from, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                  Text(bus.duration, style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(bus.arrival, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(bus.to, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ],
              ),
              const Divider(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: bus.amenities.take(3).map((a) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: AmenityChip(label: a),
                    )).toList(),
                  ),
                  Text(
                    '₹${bus.price.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
