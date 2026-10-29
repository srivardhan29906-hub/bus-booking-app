import 'package:flutter_test/flutter_test.dart';
import 'package:project/services/bus_service.dart';

void main() {
  test('BusService returns buses for matching route', () {
    final results = BusService.searchBuses(from: 'Hyderabad', to: 'Bengaluru');
    expect(results.isNotEmpty, true);
  });
}
