
import 'package:flutter/material.dart';
import '../models/bus.dart';
import 'seat_selection_screen.dart';

class SearchResultsScreen extends StatelessWidget {
  final String from;
  final String to;
  final DateTime journeyDate;
  final List<Bus> buses;

  const SearchResultsScreen({
    super.key,
    required this.from,
    required this.to,
    required this.journeyDate,
    required this.buses,
  });

  @override
  Widget build(BuildContext context) {
    final matchingBuses = buses.where((bus) {
      return bus.from.toLowerCase() == from.toLowerCase() &&
          bus.to.toLowerCase() == to.toLowerCase();
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Buses'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.route,
                  color: Color(0xFF155EEF),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$from → $to\n'
                    '${journeyDate.day}/${journeyDate.month}/${journeyDate.year}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${matchingBuses.length} buses found',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          if (matchingBuses.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Icon(
                    Icons.directions_bus_outlined,
                    size: 60,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No buses found for this route.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Try Hyderabad to Bengaluru or Hyderabad to Chennai.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          else
            ...matchingBuses.map(
              (bus) => Card(
                color: Colors.white,
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFFEAF0FF),
                            child: Icon(
                              Icons.directions_bus,
                              color: Color(0xFF155EEF),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  bus.operatorName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  bus.busType,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '₹${bus.price.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 28),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          _TimeInfo(
                            label: 'Departure',
                            time: bus.departure,
                          ),
                          Column(
                            children: [
                              Text(
                                bus.duration,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF155EEF),
                              ),
                            ],
                          ),
                          _TimeInfo(
                            label: 'Arrival',
                            time: bus.arrival,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${bus.availableSeats} seats available',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      SeatSelectionScreen(
                                    bus: bus,
                                    from: from,
                                    to: to,
                                    journeyDate: journeyDate,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Select Seats'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _TimeInfo extends StatelessWidget {
  final String label;
  final String time;

  const _TimeInfo({
    required this.label,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
