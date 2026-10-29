enum SeatType { seater, sleeper }
enum SeatDeck { lower, upper }

class Seat {
  final int seatNumber;
  final int row;
  final int column;
  final SeatType type;
  final SeatDeck deck;
  final bool isBooked;
  final bool isLadiesOnly;
  final double price;
  bool isSelected;

  Seat({
    required this.seatNumber,
    required this.row,
    required this.column,
    this.type = SeatType.seater,
    this.deck = SeatDeck.lower,
    this.isBooked = false,
    this.isLadiesOnly = false,
    this.price = 0.0,
    this.isSelected = false,
  });
}
