import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
  const RulesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // ✅ FULL WIDTH
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F000000),
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TITLE
          const Padding(
            padding: EdgeInsets.only(left: 10), // ✅ subtle alignment fix
            child: Text(
             'Points are calculated based on invoice value.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
               height: 1.4,
                color: Color(0xFF111827),
              ),
            ),
          ),

          // const Text(
          //   'Points are calculated based on invoice value.',
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w700,
          //     color: Color(0xFF111827),
          //     height: 1.4,
          //   ),
          // ),

          const SizedBox(height: 16),

          /// 🔹 EARN RULE CARD
          Container(
            width: 320, // 👈 image-la irukura exact width feel
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F8FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Earn Rule:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Service > ₹1,000 → 100 pts per ₹1,000\n'
                  'Accessories > ₹5,000 → 100 pts per ₹1,000',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.9,
                    color: Color(0xFF374151),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// 🔹 REDEEM RULE (ALIGNED WITH EARN RULE TEXT START)
          const Padding(
            padding: EdgeInsets.only(left: 10), // ✅ subtle alignment fix
            child: Text(
             'Redeem Rule:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                height: 1.6,
                color: Color(0xFF111827),
              ),
            ),
          ),
          // const Text(
          //   'Redeem Rule:',
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.w700,
          //     color: Color(0xFF111827),
          //   ),
          // ),

          const SizedBox(height: 5),

          const Padding(
            padding: EdgeInsets.only(left: 10), // ✅ subtle alignment fix
            child: Text(
              'Maximum redeemable = 10% of invoice value\n'
              'Points expire 1 year after earn date.\n'
              'Oldest points are consumed first.',
              style: TextStyle(
                fontSize: 12,
                height: 1.9,
                color: Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
