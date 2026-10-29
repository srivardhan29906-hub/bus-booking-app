import '../models/booking.dart';

class BookingService {
  static final BookingService _instance = BookingService._internal();
  factory BookingService() => _instance;
  BookingService._internal();

  final List<Booking> _bookings = [];

  List<Booking> get bookings => List.unmodifiable(_bookings);

  void addBooking(Booking booking) {
    _bookings.insert(0, booking);
  }

  void cancelBooking(String bookingId) {
    _bookings.removeWhere((b) => b.id == bookingId);
  }
}
