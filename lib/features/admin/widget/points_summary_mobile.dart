import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/admin/widget/points_card_mobile.dart';


class PointsSummaryRowMobile extends StatelessWidget {
  const PointsSummaryRowMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        PointsCardMobile(title: "Total Earned ", value: "18,000", color: Color.fromARGB(255, 248, 232, 249)),
        SizedBox(width: 12),
        PointsCardMobile(title: "Redeemed Points", value: "6,000", color: Color.fromARGB(255, 227, 254, 241)),
        SizedBox(width: 12),
        PointsCardMobile(title: "Available Points", value: "12,000", color: Color.fromARGB(255, 248, 219, 224)),
        SizedBox(width: 12),
        PointsCardMobile(title: "Expiring Soon", value: "800", color: Color.fromARGB(255, 254, 249, 228)),
      ],
    );
  }
}
