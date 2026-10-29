
import 'package:flutter/material.dart';
import '../models/bus.dart';
import 'booking_confirmation_screen.dart';

class PassengerDetailsScreen extends StatefulWidget {
  final Bus bus;
  final String from;
  final String to;
  final DateTime journeyDate;
  final List<int> seats;

  const PassengerDetailsScreen({
    super.key,
    required this.bus,
    required this.from,
    required this.to,
    required this.journeyDate,
    required this.seats,
  });

  @override
  State<PassengerDetailsScreen> createState() =>
      _PassengerDetailsScreenState();
}

class _PassengerDetailsScreenState
    extends State<PassengerDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double total =
        widget.bus.price * widget.seats.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Passenger Details'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Passenger Information',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    !RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                  return 'Enter a valid 10-digit mobile number';
                }
                return null;
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email (Optional)',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null &&
                    value.isNotEmpty &&
                    !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                        .hasMatch(value)) {
                  return 'Enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 22),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Booking Summary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text('Route: ${widget.from} → ${widget.to}'),
                    const SizedBox(height: 6),
                    Text('Bus: ${widget.bus.operatorName}'),
                    const SizedBox(height: 6),
                    Text('Type: ${widget.bus.busType}'),
                    const SizedBox(height: 6),
                    Text('Seats: ${widget.seats.join(', ')}'),
                    const Divider(height: 24),
                    Row(
                      children: [
                        const Expanded(
                          child: Text('Total Amount'),
                        ),
                        Text(
                          '₹${total.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: _confirmBooking,
                child: const Text('Confirm Booking'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Demo only. No real ticket is reserved and no payment is taken.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmBooking() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final double total =
        widget.bus.price * widget.seats.length;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingConfirmationScreen(
          passengerName: _nameController.text.trim(),
          bus: widget.bus,
          from: widget.from,
          to: widget.to,
          journeyDate: widget.journeyDate,
          seats: widget.seats,
          total: total,
        ),
      ),
    );
  }
}
