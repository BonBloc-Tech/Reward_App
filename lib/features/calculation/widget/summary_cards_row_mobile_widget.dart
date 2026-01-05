import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/calculation_controller.dart';

class SummaryCardsRowMobile extends StatelessWidget {
  const SummaryCardsRowMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CalculationController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _card(
          bgColor: const Color(0xFFDDE9FF),
          iconBg: const Color(0xFF2563EB),
          icon: Icons.account_balance_wallet_outlined,
          title: 'Available\nPoints',
          value: controller.availablePoints.value.toString(),
        ),
        _card(
          bgColor: const Color(0xFFDFF5E8),
          iconBg: const Color(0xFF16A34A),
          icon: Icons.trending_up,
          title: 'Earned\nThis Month',
          value: '1,200',
        ),
        _card(
          bgColor: const Color(0xFFEFE7FF),
          iconBg: const Color(0xFF7C3AED),
          icon: Icons.card_giftcard,
          title: 'Total\nEarned',
          value: controller.totalEarned.value.toString(),
        ),
      ],
    );
  }

  Widget _card({
    required Color bgColor,
    required Color iconBg,
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconBg, size: 15),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF374151),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
