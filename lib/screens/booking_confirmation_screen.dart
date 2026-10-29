
import 'package:flutter/material.dart';
import '../models/bus.dart';
import 'my_bookings_screen.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String passengerName;
  final Bus bus;
  final String from;
  final String to;
  final DateTime journeyDate;
  final List<int> seats;
  final double total;

  const BookingConfirmationScreen({
    super.key,
    required this.passengerName,
    required this.bus,
    required this.from,
    required this.to,
    required this.journeyDate,
    required this.seats,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final String bookingId =
        'BG${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

    final String formattedDate =
        '${journeyDate.day}/${journeyDate.month}/${journeyDate.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 12),
          const CircleAvatar(
            radius: 42,
            backgroundColor: Color(0xFFDDF8E8),
            child: Icon(
              Icons.check_circle,
              color: Color(0xFF16834A),
              size: 56,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Booking Confirmed!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your demo ticket is ready.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 24),
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.qr_code_2,
                    size: 100,
                    color: Color(0xFF155EEF),
                  ),
                  const Text(
                    'Demo QR placeholder',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const Divider(height: 32),
                  _detail('Booking ID', bookingId),
                  _detail('Passenger', passengerName),
                  _detail('Bus Operator', bus.operatorName),
                  _detail('Bus Type', bus.busType),
                  _detail('Route', '$from → $to'),
                  _detail('Journey Date', formattedDate),
                  _detail('Seat Numbers', seats.join(', ')),
                  _detail('Total Fare', '₹${total.toStringAsFixed(0)}'),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF0FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Keep your booking details for reference.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF155EEF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            child: FilledButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyBookingsScreen(),
                  ),
                  (route) => route.isFirst,
                );
              },
              child: const Text('My Bookings'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }

  Widget _detail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
