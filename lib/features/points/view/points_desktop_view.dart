import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: Row(
        children: [
          /// ================= SIDEBAR (DESKTOP ONLY) =================
          if (!isMobile) const SideMenu(),

          /// ================= MAIN CONTENT =================
          Expanded(
            child: Column(
              children: [
                /// ================= TOP APP BAR =================
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Points",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                          const SizedBox(width: 10),
                          if (!isMobile)
                            const Text(
                              "BHARAT KALRA & CO",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),

                /// ================= BODY =================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// ================= TOP SUMMARY =================
                        isMobile
                            ? _mobileStats()
                            : _desktopStats(),

                        const SizedBox(height: 28),

                        /// ================= CHART + INFO =================
                        isMobile
                            ? Column(
                                children: const [
                                  PointsActivityChart(),
                                  SizedBox(height: 24),
                                  InfoSideCard(),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
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

  /// ================= MOBILE STATS =================
  Widget _mobileStats() {
    return Column(
      children: const [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: "Available\nPoints",
                value: "12,000",
                icon: Icons.account_balance_wallet,
                bgColor: Color(0xFFEFF4FF),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: StatCard(
                title: "Earned\nThis Month",
                value: "1,200",
                icon: Icons.trending_up,
                bgColor: Color(0xFFEFFAF3),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: "Total\nEarned",
                value: "18,000",
                icon: Icons.card_giftcard,
                bgColor: Color(0xFFF6EEFF),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: TierProgressCard(),
            ),
          ],
        ),
      ],
    );
  }

  /// ================= DESKTOP STATS =================
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
