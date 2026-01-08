import 'package:flutter/material.dart';

class PointsCardMobile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const PointsCardMobile({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ,style: const TextStyle(
                    fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(value,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
