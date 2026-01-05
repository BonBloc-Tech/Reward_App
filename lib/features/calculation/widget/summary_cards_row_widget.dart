import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculation_controller.dart';

class SummaryCardsRow extends StatelessWidget {
  const SummaryCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalculationController>();

    return Row(
      children: [
        _buildSummaryCard(
          title: 'Available Points',
          value: controller.availablePoints.value,
          icon: Icons.account_balance_wallet_outlined,
          color: const Color(0xFF2563EB),
          width: 200,
          backgroundColor: Color(0xFFEFF4FF),
        ),
        const SizedBox(width: 40),
        _buildSummaryCard(
          title: 'Total Redeemed Points',
          value: controller.totalRedeemed.value,
          icon: Icons.lock_open_outlined,
          color: const Color(0xFF16A34A),
          width: 205,
          backgroundColor: Color(0xFFEFFAF3),
        ),
        const SizedBox(width: 40),
        _buildSummaryCard(
          title: 'Total Earned Points',
          value: controller.totalEarned.value,
          icon: Icons.card_giftcard_outlined,
          color: const Color(0xFF7C3AED),
          width: 200,
          backgroundColor: Color(0xFFF6EEFF),
        ),
      ],
    );
  }

  Widget _buildSummaryCard({
    required String title,
    required int value,
    required IconData icon,
    required Color color,
    required double width,
    required Color backgroundColor,
  }) {
    return SizedBox(
      width: width, // 👈 Fixed width per card
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor, // 👈 Individual BG color
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE5E7EB)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: color,
                size: 12,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
