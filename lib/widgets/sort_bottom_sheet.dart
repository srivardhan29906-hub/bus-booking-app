import 'package:flutter/material.dart';

enum SortOption { priceLowToHigh, priceHighToLow, rating, fastest }

class SortBottomSheet extends StatelessWidget {
  final SortOption selected;
  final Function(SortOption) onSelect;

  const SortBottomSheet({super.key, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Sort Buses By', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Text('Price: Low to High'),
            trailing: selected == SortOption.priceLowToHigh ? const Icon(Icons.check, color: Colors.blue) : null,
            onTap: () => onSelect(SortOption.priceLowToHigh),
          ),
          ListTile(
            title: const Text('Price: High to Low'),
            trailing: selected == SortOption.priceHighToLow ? const Icon(Icons.check, color: Colors.blue) : null,
            onTap: () => onSelect(SortOption.priceHighToLow),
          ),
          ListTile(
            title: const Text('Highest Rated'),
            trailing: selected == SortOption.rating ? const Icon(Icons.check, color: Colors.blue) : null,
            onTap: () => onSelect(SortOption.rating),
          ),
        ],
      ),
    );
  }
}
