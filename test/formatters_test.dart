import 'package:flutter_test/flutter_test.dart';
import 'package:project/utils/currency_formatter.dart';
import 'package:project/utils/date_formatter.dart';

void main() {
  test('CurrencyFormatter formats currency string properly', () {
    expect(CurrencyFormatter.format(500), '₹500');
  });

  test('DateFormatter formats day and month', () {
    final date = DateTime(2026, 10, 29);
    expect(DateFormatter.formatDayMonth(date), '29 Oct');
  });
}
