
import 'package:flutter/material.dart';
import '../models/bus.dart';
import 'passenger_details_screen.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Bus bus;
  final String from;
  final String to;
  final DateTime journeyDate;

  const SeatSelectionScreen({
    super.key,
    required this.bus,
    required this.from,
    required this.to,
    required this.journeyDate,
  });

  @override
  State<SeatSelectionScreen> createState() =>
      _SeatSelectionScreenState();
}

class _SeatSelectionScreenState
    extends State<SeatSelectionScreen> {
  final Set<int> selectedSeats = {};
  final Set<int> bookedSeats = {3, 7, 12, 18, 22};

  @override
  Widget build(BuildContext context) {
    final double total =
        selectedSeats.length * widget.bus.price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Seats'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                  Icons.directions_bus,
                  color: Color(0xFF155EEF),
                  size: 32,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${widget.bus.operatorName}\n'
                    '${widget.from} → ${widget.to}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Wrap(
            spacing: 14,
            children: [
              _SeatLegend(
                color: Colors.white,
                label: 'Available',
              ),
              _SeatLegend(
                color: Color(0xFF155EEF),
                label: 'Selected',
              ),
              _SeatLegend(
                color: Color(0xFFB8C0CC),
                label: 'Booked',
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFDDE2EC),
                  ),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.airline_seat_recline_extra,
                        size: 30,
                        color: Color(0xFF155EEF),
                      ),
                    ),
                    const Divider(height: 28),
                    for (int row = 0; row < 6; row++) ...[
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                        children: [
                          for (int col = 0; col < 4; col++)
                            if (col == 2)
                              const SizedBox(width: 22)
                            else
                              _buildSeat(
                                row * 3 + (col < 2 ? col : col - 1) + 1,
                              ),
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${selectedSeats.length} seats selected',
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '₹${total.toStringAsFixed(0)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  PassengerDetailsScreen(
                                bus: widget.bus,
                                from: widget.from,
                                to: widget.to,
                                journeyDate: widget.journeyDate,
                                seats: selectedSeats.toList()..sort(),
                              ),
                            ),
                          );
                        },
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeat(int number) {
    final bool isBooked = bookedSeats.contains(number);
    final bool isSelected = selectedSeats.contains(number);

    final Color seatColor = isBooked
        ? const Color(0xFFB8C0CC)
        : isSelected
            ? const Color(0xFF155EEF)
            : Colors.white;

    return InkWell(
      onTap: isBooked
          ? null
          : () {
              setState(() {
                if (isSelected) {
                  selectedSeats.remove(number);
                } else {
                  selectedSeats.add(number);
                }
              });
            },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 42,
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xFFDDE2EC),
          ),
        ),
        child: Text(
          '$number',
          style: TextStyle(
            color: isBooked || isSelected
                ? Colors.white
                : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _SeatLegend extends StatelessWidget {
  final Color color;
  final String label;

  const _SeatLegend({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
              color: const Color(0xFFB8C0CC),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
