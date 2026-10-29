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
  final double rating;
  final int totalReviews;
  final List<String> amenities;

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
    this.rating = 4.5,
    this.totalReviews = 120,
    this.amenities = const ['WiFi', 'Charging Point', 'AC', 'Water Bottle'],
  });
}
