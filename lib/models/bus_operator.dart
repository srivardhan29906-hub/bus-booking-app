class BusOperator {
  final String id;
  final String name;
  final double rating;
  final int totalReviews;
  final String helpline;
  final String cancellationPolicy;

  const BusOperator({
    required this.id,
    required this.name,
    required this.rating,
    required this.totalReviews,
    required this.helpline,
    this.cancellationPolicy = 'Free cancellation up to 6 hours before departure',
  });
}
