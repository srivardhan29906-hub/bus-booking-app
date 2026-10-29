import 'package:flutter/material.dart';

class AmenityChip extends StatelessWidget {
  final String label;

  const AmenityChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F4F7),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Color(0xFF475467)),
      ),
    );
  }
}
