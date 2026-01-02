import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color bgColor;

  /// OPTIONAL DECORATION (for box shadow override)
  final BoxDecoration? decoration;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.bgColor,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 10,
      ),

      /// 👉 If decoration passed → use it
      /// 👉 else → default decoration with shadow
      decoration: decoration ??
          BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(31, 83, 83, 83),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ICON
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: 18,
              color: Colors.blue,
            ),
          ),

          const SizedBox(height: 8),

          /// TITLE
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 3,
            softWrap: true,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 6),

          /// VALUE
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
