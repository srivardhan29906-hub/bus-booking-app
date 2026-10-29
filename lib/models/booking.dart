
class Booking {
  final String id;
  final String passengerName;
  final String phoneNumber;
  final String busId;
  final String busName;
  final String from;
  final String to;
  final DateTime journeyDate;
  final List<int> seatNumbers;
  final double totalAmount;
  final String status;

  const Booking({
    required this.id,
    required this.passengerName,
    required this.phoneNumber,
    required this.busId,
    required this.busName,
    required this.from,
    required this.to,
    required this.journeyDate,
    required this.seatNumbers,
    required this.totalAmount,
    this.status = 'Confirmed',
  });
}
