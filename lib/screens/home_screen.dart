
import 'package:flutter/material.dart';
import '../data/sample_buses.dart';
import 'search_results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fromController =
      TextEditingController(text: 'Hyderabad');

  final TextEditingController _toController =
      TextEditingController(text: 'Bengaluru');

  DateTime _journeyDate = DateTime.now().add(
    const Duration(days: 1),
  );

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _journeyDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (selectedDate != null) {
      setState(() {
        _journeyDate = selectedDate;
      });
    }
  }

  void _swapLocations() {
    final String oldFrom = _fromController.text;
    _fromController.text = _toController.text;
    _toController.text = oldFrom;
  }

  void _searchBuses() {
    final String from = _fromController.text.trim();
    final String to = _toController.text.trim();

    if (from.isEmpty || to.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Enter source and destination'),
        ),
      );
      return;
    }

    if (from.toLowerCase() == to.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Source and destination must be different',
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsScreen(
          from: from,
          to: to,
          journeyDate: _journeyDate,
          buses: sampleBuses,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        '${_journeyDate.day.toString().padLeft(2, '0')}/'
        '${_journeyDate.month.toString().padLeft(2, '0')}/'
        '${_journeyDate.year}';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BusGo',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Profile',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF155EEF),
                  Color(0xFF6938EF),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Where will you go?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Find your bus and book your journey.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Card(
            color: Colors.white,
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  TextField(
                    controller: _fromController,
                    decoration: const InputDecoration(
                      labelText: 'From',
                      prefixIcon: Icon(
                        Icons.trip_origin,
                        color: Color(0xFF155EEF),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: _swapLocations,
                      icon: const Icon(
                        Icons.swap_vert,
                        color: Color(0xFF155EEF),
                      ),
                      tooltip: 'Swap locations',
                    ),
                  ),
                  TextField(
                    controller: _toController,
                    decoration: const InputDecoration(
                      labelText: 'To',
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF155EEF),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  InkWell(
                    onTap: _selectDate,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F5FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Color(0xFF155EEF),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Journey date',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton.icon(
                      onPressed: _searchBuses,
                      icon: const Icon(Icons.search),
                      label: const Text('Search Buses'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Popular destinations',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _destinationChip('Bengaluru'),
              _destinationChip('Chennai'),
              _destinationChip('Hyderabad'),
              _destinationChip('Vijayawada'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _destinationChip(String city) {
    return ActionChip(
      avatar: const Icon(
        Icons.location_on_outlined,
        size: 18,
      ),
      label: Text(city),
      onPressed: () {
        setState(() {
          _toController.text = city;
        });
      },
    );
  }
}
