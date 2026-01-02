import 'package:flutter/material.dart';

class TierProgressCard extends StatelessWidget {
  const TierProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    const int currentPoints = 12500;
    const int totalPoints = 15000;
    const double progress = currentPoints / totalPoints;
    const int remainingPoints = totalPoints - currentPoints;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2563EB),
            Color(0xFF9333EA),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// TOP ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Next Tier: Platinum",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.workspace_premium,
                color: Colors.amber,
                size: 22,
              ),
            ],
          ),

          const SizedBox(height: 6),

          /// SUB TEXT
          Text(
            "You are $remainingPoints points away!",
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 14),

          /// PROGRESS BAR (FULL WIDTH)
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0xFFFACC15),
              ),
            ),
          ),

          const SizedBox(height: 6),

          /// % + POINTS ROW
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${(progress * 100).toStringAsFixed(1)}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                "${_format(currentPoints)} / ${_format(totalPoints)} points",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _format(int value) {
    return value.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (m) => '${m[1]},',
    );
  }
}
