import 'package:flutter/material.dart';

class Amenity {
  final String id;
  final String name;
  final IconData icon;
  final String description;

  const Amenity({
    required this.id,
    required this.name,
    required this.icon,
    this.description = '',
  });

  static const List<Amenity> defaultAmenities = [
    Amenity(id: 'wifi', name: 'Free WiFi', icon: Icons.wifi, description: 'High-speed 4G connectivity'),
    Amenity(id: 'ac', name: 'Air Conditioning', icon: Icons.ac_unit, description: 'Climate controlled cabin'),
    Amenity(id: 'charging', name: 'Charging Point', icon: Icons.power, description: 'Universal USB / AC sockets'),
    Amenity(id: 'water', name: 'Water Bottle', icon: Icons.local_drink, description: 'Complimentary packaged water'),
    Amenity(id: 'blanket', name: 'Blanket & Pillow', icon: Icons.hotel, description: 'Sanitized sleep kit'),
    Amenity(id: 'track', name: 'Live Tracking', icon: Icons.location_on, description: 'GPS live location updates'),
    Amenity(id: 'reading_light', name: 'Reading Light', icon: Icons.lightbulb, description: 'Personal reading lamp'),
    Amenity(id: 'emergency', name: 'Emergency Exit', icon: Icons.exit_to_app, description: 'Safety certified vehicle'),
  ];
}
