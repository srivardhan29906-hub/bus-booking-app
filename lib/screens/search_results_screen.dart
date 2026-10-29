
import 'package:flutter/material.dart';

import '../models/bus.dart';
import 'seat_selection_screen.dart';

class SearchResultsScreen extends StatefulWidget {
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
  State<SearchResultsScreen> createState() =>
      _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  String selectedType = 'All';
  String sortBy = 'Recommended';
  bool acOnly = false;
  bool sleeperOnly = false;

  List<Bus> get filteredBuses {
    final results = widget.buses.where((bus) {
      final routeMatches =
          bus.from.toLowerCase().trim() ==
                  widget.from.toLowerCase().trim() &&
              bus.to.toLowerCase().trim() ==
                  widget.to.toLowerCase().trim();

      final typeMatches = selectedType == 'All' ||
          (selectedType == 'AC'
              ? bus.busType.toLowerCase().contains('ac')
              : !bus.busType.toLowerCase().contains('ac'));

      final acMatches = !acOnly ||
          bus.busType.toLowerCase().contains('ac');

      final sleeperMatches = !sleeperOnly ||
          bus.busType.toLowerCase().contains('sleeper');

      return routeMatches &&
          typeMatches &&
          acMatches &&
          sleeperMatches;
    }).toList();

    switch (sortBy) {
      case 'Lowest Price':
        results.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Earliest Departure':
        results.sort((a, b) =>
            _timeToMinutes(a.departure).compareTo(
              _timeToMinutes(b.departure),
            ));
        break;
      case 'Most Seats':
        results.sort((a, b) =>
            b.availableSeats.compareTo(a.availableSeats));
        break;
    }

    return results;
  }

  int _timeToMinutes(String time) {
    final match = RegExp(
      r'(\d{1,2}):(\d{2})\s*(AM|PM)',
      caseSensitive: false,
    ).firstMatch(time.trim());

    if (match == null) return 0;

    int hour = int.parse(match.group(1)!);
    final minute = int.parse(match.group(2)!);
    final period = match.group(3)!.toUpperCase();

    hour %= 12;
    if (period == 'PM') hour += 12;

    return hour * 60 + minute;
  }

  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    return '${widget.journeyDate.day} '
        '${months[widget.journeyDate.month - 1]} '
        '${widget.journeyDate.year}';
  }

  void _resetFilters() {
    setState(() {
      selectedType = 'All';
      sortBy = 'Recommended';
      acOnly = false;
      sleeperOnly = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final buses = filteredBuses;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: const Text(
          'Available Buses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF155EEF),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Color(0xFF155EEF),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(22),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${widget.from} → ${widget.to}',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  '${buses.length} buses found',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 4),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.filter_list,
                      color: Color(0xFF155EEF),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Filters',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _resetFilters,
                      child: const Text('Reset'),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _filterChip('All', selectedType,
                          (value) => setState(
                              () => selectedType = value)),
                      const SizedBox(width: 8),
                      _filterChip('AC', selectedType,
                          (value) => setState(
                              () => selectedType = value)),
                      const SizedBox(width: 8),
                      _filterChip('Non-AC', selectedType,
                          (value) => setState(
                              () => selectedType = value)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text(
                          'AC only',
                          style: TextStyle(fontSize: 13),
                        ),
                        value: acOnly,
                        onChanged: (value) => setState(
                          () => acOnly = value ?? false,
                        ),
                        controlAffinity:
                            ListTileControlAffinity.leading,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text(
                          'Sleeper only',
                          style: TextStyle(fontSize: 13),
                        ),
                        value: sleeperOnly,
                        onChanged: (value) => setState(
                          () => sleeperOnly = value ?? false,
                        ),
                        controlAffinity:
                            ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  value: sortBy,
                  decoration: InputDecoration(
                    labelText: 'Sort buses',
                    prefixIcon:
                        const Icon(Icons.sort, size: 20),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Recommended',
                      child: Text('Recommended'),
                    ),
                    DropdownMenuItem(
                      value: 'Lowest Price',
                      child: Text('Lowest Price'),
                    ),
                    DropdownMenuItem(
                      value: 'Earliest Departure',
                      child: Text('Earliest Departure'),
                    ),
                    DropdownMenuItem(
                      value: 'Most Seats',
                      child: Text('Most Available Seats'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => sortBy = value);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: buses.isEmpty
                ? _emptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: buses.length,
                    itemBuilder: (context, index) {
                      return _busCard(buses[index], index);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(
    String label,
    String selected,
    ValueChanged<String> onSelected,
  ) {
    final active = label == selected;

    return ChoiceChip(
      label: Text(label),
      selected: active,
      onSelected: (_) => onSelected(label),
      selectedColor: const Color(0xFFDCE7FF),
      labelStyle: TextStyle(
        color: active
            ? const Color(0xFF155EEF)
            : Colors.black87,
        fontWeight: FontWeight.w600,
      ),
      side: BorderSide(
        color: active
            ? const Color(0xFF155EEF)
            : Colors.black12,
      ),
    );
  }

  Widget _busCard(Bus bus, int index) {
    return TweenAnimationBuilder<double>(
      key: ValueKey(bus.id),
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 300 + index * 100),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 18 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 14),
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8EEFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.directions_bus_filled,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          bus.busType,
                          style: const TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹${bus.price}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: Color(0xFF155EEF),
                        ),
                      ),
                      const Text(
                        'per seat',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(height: 1),
              ),
              Row(
                children: [
                  Expanded(
                    child: _timeInfo(
                      bus.departure,
                      'Departure',
                      Icons.trip_origin,
                    ),
                  ),
                  Column(
                    children: [
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.blueGrey,
                        size: 20,
                      ),
                      Text(
                        bus.duration,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: _timeInfo(
                      bus.arrival,
                      'Arrival',
                      Icons.location_on_outlined,
                      alignEnd: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.event_seat_outlined,
                    size: 17,
                    color: Colors.teal,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '${bus.availableSeats} seats available',
                    style: const TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: bus.availableSeats <= 0
                        ? null
                        : () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    SeatSelectionScreen(
                                  bus: bus,
                                  from: widget.from,
                                  to: widget.to,
                                  journeyDate:
                                      widget.journeyDate,
                                ),
                              ),
                            );
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF155EEF),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Select Seats'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeInfo(
    String time,
    String label,
    IconData icon, {
    bool alignEnd = false,
  }) {
    return Column(
      crossAxisAlignment: alignEnd
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: alignEnd
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Icon(icon, size: 13, color: Colors.blueGrey),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _emptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_bus_outlined,
              size: 76,
              color: Colors.blueGrey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No buses found',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Try changing your filters or selecting '
              'another route.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: _resetFilters,
              icon: const Icon(Icons.refresh),
              label: const Text('Reset filters'),
            ),
          ],
        ),
      ),
    );
  }
}
