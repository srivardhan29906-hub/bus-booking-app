import 'package:flutter/material.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        return Container(
          height: 120,
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 16, width: 140, color: const Color(0xFFF2F4F7)),
                const SizedBox(height: 12),
                Container(height: 14, width: 200, color: const Color(0xFFF2F4F7)),
                const Spacer(),
                Container(height: 16, width: 80, color: const Color(0xFFF2F4F7)),
              ],
            ),
          ),
        );
      },
    );
  }
}
