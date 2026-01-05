import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import '../controller/points_controller.dart';
import '../../../core/global_widgets/stat_card.dart';
import '../../../core/global_widgets/tier_progress_card.dart';
import '../../../core/global_widgets/points_activity_chart.dart';
import '../../../core/global_widgets/info_side_card.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PointsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 64,
                  child: GlobalAppBar(title: 'Points Overview'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _desktopStats(),
                        const SizedBox(height: 28),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: PointsActivityChart(),
                            ),
                            SizedBox(width: 24),
                            Expanded(
                              flex: 2,
                              child: InfoSideCard(),
                            ),
                          ],
                        ),
                      ],
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

  Widget _desktopStats() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          width: 210,
          child: StatCard(
            title: "Available\nPoints",
            value: "12,000",
            icon: Icons.account_balance_wallet,
            bgColor: Color.fromARGB(255, 208, 229, 247),
          ),
        ),
        SizedBox(width: 25),
        SizedBox(
          width: 210,
          child: StatCard(
            title: "Earned This\nMonth",
            value: "1,200",
            icon: Icons.trending_up,
            bgColor: Color.fromARGB(255, 217, 248, 228),
          ),
        ),
        SizedBox(width: 25),
        SizedBox(
          width: 215,
          child: StatCard(
            title: "Total Earned\nPoints",
            value: "18,000",
            icon: Icons.card_giftcard,
            bgColor: Color.fromARGB(255, 232, 216, 250),
          ),
        ),
        SizedBox(width: 25),
        Expanded(
          child: TierProgressCard(),
        ),
      ],
    );
  }
}
