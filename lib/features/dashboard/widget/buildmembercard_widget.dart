import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BuildMembershipCard extends StatelessWidget {
  final String title;
  final String level;
  final double percent;

  const BuildMembershipCard({
    super.key,
    required this.title,
    required this.level,
    required this.percent,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:  Color.fromARGB(255, 173, 121, 241),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          Text(
            level,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            lineHeight: 8,
            percent: percent,
            progressColor: Colors.white,
            // ignore: deprecated_member_use
            backgroundColor: Colors.white.withOpacity(0.3),
            barRadius: const Radius.circular(8),
          ),
        ],
      ),
    );
  }
}
