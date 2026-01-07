
import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard_widget.dart';

class Pointswidget extends StatelessWidget {
  const Pointswidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Points Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Available Points",
                  value: "12,000",
                  color: const Color.fromARGB(255, 151, 188, 224),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: BuildMembershipCard(
                  title: "Membership",
                  level: "Gold",
                  percent: 0.83,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Total Earned",
                  value: "18,000",
                  color:Color(0xFFDECFF1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BuildPointCard(
                  title: "Redeemed",
                  value: "6,000",
                  color:const Color.fromARGB(255, 151, 188, 224),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
