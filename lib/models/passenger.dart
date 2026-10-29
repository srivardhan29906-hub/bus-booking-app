class Passenger {
  final String name;
  final int age;
  final String gender;
  final int seatNumber;

  const Passenger({
    required this.name,
    required this.age,
    required this.gender,
    required this.seatNumber,
  });

  Map<String, dynamic> toMap() => {
    'name': name,
    'age': age,
    'gender': gender,
    'seatNumber': seatNumber,
  };
}
