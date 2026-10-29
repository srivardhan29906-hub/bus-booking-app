class City {
  final String name;
  final String state;
  final String code;

  const City({required this.name, required this.state, required this.code});
}

const List<City> popularCities = [
  City(name: 'Hyderabad', state: 'Telangana', code: 'HYD'),
  City(name: 'Bengaluru', state: 'Karnataka', code: 'BLR'),
  City(name: 'Chennai', state: 'Tamil Nadu', code: 'MAA'),
  City(name: 'Mumbai', state: 'Maharashtra', code: 'BOM'),
  City(name: 'Pune', state: 'Maharashtra', code: 'PNQ'),
  City(name: 'Vijayawada', state: 'Andhra Pradesh', code: 'VJA'),
  City(name: 'Visakhapatnam', state: 'Andhra Pradesh', code: 'VTZ'),
  City(name: 'Goa', state: 'Goa', code: 'GOI'),
  City(name: 'Coimbatore', state: 'Tamil Nadu', code: 'CJB'),
];
