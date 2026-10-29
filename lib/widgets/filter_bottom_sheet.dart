import 'package:flutter/material.dart';
import '../models/bus_filter.dart';
import '../core/theme/app_colors.dart';

class FilterBottomSheet extends StatefulWidget {
  final BusFilterOptions initialFilter;
  final Function(BusFilterOptions) onApply;

  const FilterBottomSheet({super.key, required this.initialFilter, required this.onApply});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  late BusFilterOptions _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Filter Buses', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  setState(() => _filter.reset());
                },
                child: const Text('Reset'),
              )
            ],
          ),
          CheckboxListTile(
            title: const Text('AC Only'),
            value: _filter.acOnly,
            onChanged: (val) => setState(() => _filter.acOnly = val ?? false),
          ),
          CheckboxListTile(
            title: const Text('Sleeper Only'),
            value: _filter.sleeperOnly,
            onChanged: (val) => setState(() => _filter.sleeperOnly = val ?? false),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onApply(_filter);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              backgroundColor: AppColors.primary,
            ),
            child: const Text('Apply Filters', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
