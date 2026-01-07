import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';
import '../controller/points_controller.dart';
import '../../../core/global_widgets/stat_card.dart';
import '../../../core/global_widgets/tier_progress_card.dart';
import '../../../core/global_widgets/points_activity_chart.dart';
import '../../../core/global_widgets/info_side_card.dart';

class PointsScreenMobile extends StatefulWidget {
  const PointsScreenMobile({super.key});

  @override
  State<PointsScreenMobile> createState() => _PointsScreenMobileState();
}

class _PointsScreenMobileState extends State<PointsScreenMobile> {
  late List<Widget> sections;

  @override
  void initState() {
    super.initState();
    Get.put(PointsController());

    sections = [
      _buildStatCards(),
      const TierProgressCard(),
      const PointsActivityChart(),
      const InfoSideCard(),
    ];
  }

  /// 🔹 TOP STAT CARDS
  Widget _buildStatCards() {
    return GridView.count(
      key: const ValueKey("stat_cards"),
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 16,
      childAspectRatio: 0.78,
      children: const [
        StatCard(
          title: "Available",
          value: "12,000",
          icon: Icons.account_balance_wallet,
          bgColor: Color(0xFFC6D4F0),
        ),
        StatCard(
          title: "Earned\nThis Month",
          value: "1,200",
          icon: Icons.trending_up,
          bgColor: Color(0xFFCEF1DB),
        ),
        StatCard(
          title: "Total\nEarned",
          value: "18,000",
          icon: Icons.card_giftcard,
          bgColor: Color(0xFFDECFF1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      /// ✅ APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Points',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage:
                  AssetImage('assets/logo/profile_logo.png'),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: ReorderableListView(
          padding: const EdgeInsets.all(16),
          buildDefaultDragHandles: true,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = sections.removeAt(oldIndex);
              sections.insert(newIndex, item);
            });
          },
          children: List.generate(
            sections.length,
            (index) => Padding(
              key: ValueKey(index),
              padding: const EdgeInsets.only(bottom: 24),
              child: sections[index],
            ),
          ),
        ),
      ),

      bottomNavigationBar: const MobileBottomNav(currentIndex: 1,),
    );
  }
}
