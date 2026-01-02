import 'package:flutter/material.dart';

class PointsSummaryCard extends StatelessWidget {
  const PointsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      padding: const EdgeInsets.all(18),
      decoration: _mainDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Points Summary',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 11),

          _row(
            title: 'Total Earned Points',
            value: '18,000 pts',
            icon: Icons.card_giftcard_outlined,
            iconColor: const Color(0xFF7C3AED),
            bg: const Color(0xFFF6EEFF),
          ),
          const SizedBox(height: 11),

          _row(
            title: 'Total Redeemed Points',
            value: '6,000 pts',
            icon: Icons.lock_open_outlined,
            iconColor: const Color(0xFF16A34A),
            bg: const Color(0xFFEFFAF3),
          ),
          const SizedBox(height: 11),

          _row(
            title: 'Available Points',
            value: '12,000 pts',
            icon: Icons.account_balance_wallet_outlined,
            iconColor: const Color(0xFFF28BA4),
            bg: const Color.fromARGB(255, 253, 233, 233),

          ),
        ],
      ),
    );
  }

  /// 🔹 FLOATING SUMMARY ROW (MATCHES SECOND IMAGE)
  Widget _row({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color bg,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // soft shadow
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          /// ICON
          Container(
            width: 32,
            height: 30,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 16,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 11),

          /// TITLE
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
          ),

          /// VALUE
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 MAIN CARD SHADOW
  BoxDecoration _mainDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(
          color: Color(0x14000000),
          blurRadius: 20,
          offset: Offset(0, 8),
        ),
      ],
    );
  }
}
