import 'package:flutter/material.dart';

class InfoSideCard extends StatelessWidget {
  const InfoSideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _card(
          icon: Icons.event,
          title: "Expiry Date",
          content: "Valid for 1 year from date of Redeem Earning",
        ),

        const SizedBox(height: 18),

        _card(
          title: "Ways to Earn Points",
          content:
              "• Service your vehicle at authorized centers\n"
              "• Purchase spare parts or accessories",
        ),

        const SizedBox(height: 18),

        _card(
          title: "Description",
          content:
              "Your Points & Rewards is designed to give you more value every time you service or maintain your vehicle.\n\n"
              "Earn points on eligible purchases and redeem them for services, accessories, and exclusive benefits.",
        ),
      ],
    );
  }

  /// Reusable Card Widget
  Widget _card({
    IconData? icon, // ✅ optional
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon + Title Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 251, 239),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: const Color.fromARGB(255, 235, 166, 37),
                  ),
                ),

              if (icon != null) const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          /// Content
          Text(
            content,
            style: const TextStyle(
              color: Color.fromARGB(238, 77, 72, 72),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
