import '../models/bus.dart';
import '../models/bus_filter.dart';
import '../data/sample_buses.dart';

class BusService {
  static List<Bus> searchBuses({
    required String from,
    required String to,
    BusFilterOptions? filter,
  }) {
    List<Bus> results = sampleBuses.where((b) {
      final matchesFrom = b.from.toLowerCase() == from.toLowerCase();
      final matchesTo = b.to.toLowerCase() == to.toLowerCase();
      return matchesFrom && matchesTo;
    }).toList();

    if (results.isEmpty) {
      // Fallback: show sample buses matching destination or general routes
      results = List.from(sampleBuses);
    }

    if (filter != null) {
      if (filter.acOnly) {
        results = results.where((b) => b.busType.contains('AC')).toList();
      }
      if (filter.sleeperOnly) {
        results = results.where((b) => b.busType.contains('Sleeper')).toList();
      }
    }

    return results;
  }
}
