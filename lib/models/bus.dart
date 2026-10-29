
class Bus {
  final String id;
  final String operatorName;
  final String busType;
  final String departure;
  final String arrival;
  final String duration;
  final double price;
  final int availableSeats;
  final String from;
  final String to;

  const Bus({
    required this.id,
    required this.operatorName,
    required this.busType,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.price,
    required this.availableSeats,
    required this.from,
    required this.to,
  });
}
