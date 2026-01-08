import 'package:flutter/material.dart';
import 'points_card.dart';

class PointsSummaryRow extends StatelessWidget {
  const PointsSummaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PointsCard(title: "Total Earned Points", value: "18,000", color: Color.fromARGB(255, 248, 232, 249)),
        SizedBox(width: 12),
        PointsCard(title: "Redeemed Points", value: "6,000", color: Color.fromARGB(255, 227, 254, 241)),
        SizedBox(width: 12),
        PointsCard(title: "Available Points", value: "12,000", color: Color.fromARGB(255, 248, 219, 224)),
        SizedBox(width: 12),
        PointsCard(title: "Expiring Soon", value: "800", color: Color.fromARGB(255, 254, 249, 228)),
      ],
    );
  }
}
