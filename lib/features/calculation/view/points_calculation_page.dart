import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';


import 'package:sm_reward_app/features/calculation/widget/points_summary_overview_card.dart';
import 'package:sm_reward_app/features/calculation/widget/rules_card.dart';

import '../controller/calculation_controller.dart';
import '../widget/invoice_table.dart';


class PointsCalculationPage extends StatelessWidget {
  const PointsCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {

    // ✅ VERY IMPORTANT: Inject controller here
    Get.put(CalculationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Row(
        children: [
          /// 🔹 SIDE MENU
          const SideMenu(),

          /// 🔹 MAIN AREA
          Expanded(
            child: Column(
              children: [
                /// 🔹 TOP HEADER
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Points Calculation Page',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/logo/profile_logo.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'BHARAT KALRA & CO',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// 🔹 BODY
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 RULES + SUMMARY
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              /// LEFT – RULES CARD
                              Expanded(
                                flex: 3,
                                child: RulesCard(),
                              ),

                              SizedBox(width: 44),

                              /// RIGHT – POINTS SUMMARY
                              Expanded(
                                flex: 3,
                                child: PointsSummaryOverviewCard(),
                              ),
                            ],
                          ),

                          const SizedBox(height: 28),

                          /// 🔹 TABLE TITLE
                          const Text(
                            'Invoice Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// 🔹 INVOICE TABLE
                          const InvoiceTable(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
