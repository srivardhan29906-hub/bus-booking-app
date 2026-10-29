import 'package:flutter/material.dart';
import '../models/booking.dart';
import '../core/theme/app_colors.dart';

class TicketDetailsScreen extends StatelessWidget {
  final Booking booking;

  const TicketDetailsScreen({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('E-Ticket Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(booking.busName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(booking.status, style: const TextStyle(color: AppColors.success, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const Divider(height: 24),
                Text('PNR: ${booking.pnrNumber}', style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                const SizedBox(height: 8),
                Text('Route: ${booking.from} -> ${booking.to}'),
                const SizedBox(height: 8),
                Text('Passenger: ${booking.passengerName} (${booking.phoneNumber})'),
                const SizedBox(height: 8),
                Text('Seats: ${booking.seatNumbers.join(", ")}'),
                const SizedBox(height: 8),
                Text('Total: ₹${booking.totalAmount.toStringAsFixed(0)}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
