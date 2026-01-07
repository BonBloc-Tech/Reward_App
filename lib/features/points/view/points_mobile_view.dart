import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';

import '../controller/points_controller.dart';
import '../../../core/global_widgets/stat_card.dart';


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
      _buildTierProgressCard(),
      _buildPointsActivitySection(),
      _buildInfoCards(),
    ];
  }

  /// 🔹 STAT CARDS
  Widget _buildStatCards() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
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

  /// 🔹 TIER CARD
  Widget _buildTierProgressCard() {
    const current = 12500;
    const total = 15000;
    final progress = current / total;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2563EB), Color(0xFF9333EA)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Tier: Platinum",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "You are 2500 points away!",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Color(0xFFFACC15)),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "12,500 / 15,000 points",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// 🔹 CHART + SUMMARY
  Widget _buildPointsActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Points Activity (Last 6 Months)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        /// CHART
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildLegend(),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: BarChart(
                  BarChartData(
                    maxY: 1500,
                    barGroups: _barGroups(),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 500,
                          getTitlesWidget: (v, _) =>
                              Text(v.toInt().toString(), style: const TextStyle(fontSize: 10)),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (v, _) {
                            const m = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                            return Text(m[v.toInt()], style: const TextStyle(fontSize: 11));
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        /// SUMMARY CARDS
        Row(
          children: [
            _summaryCard(
              title: "Earned Points",
              value: "6,500",
              color: const Color(0xFFEFF4FF),
              textColor: Colors.blue,
            ),
            const SizedBox(width: 12),
            _summaryCard(
              title: "Redeemed Points",
              value: "2,400",
              color: const Color(0xFFFFF1F1),
              textColor: Colors.red,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.square, color: Colors.blue, size: 12),
        SizedBox(width: 6),
        Text("Points Earned"),
        SizedBox(width: 16),
        Icon(Icons.square, color: Colors.red, size: 12),
        SizedBox(width: 6),
        Text("Points Redeemed"),
      ],
    );
  }

  Widget _summaryCard({
    required String title,
    required String value,
    required Color color,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 INFO CARDS
  Widget _buildInfoCards() {
    return Column(
      children: [
        _infoCard(
          "Expiry Date",
          "Valid for 1 year from date of Redeem Earning",
        ),
        const SizedBox(height: 16),
        _infoCard(
          "Ways to Earn Points",
          "• Service your vehicle at authorized centers\n• Purchase spare parts or accessories",
        ),
        const SizedBox(height: 16),
        _infoCard(
          "Description",
          "Your Points & Rewards is designed to give you more value every time you service or maintain your vehicle.\n\nEarn points on eligible purchases and redeem them for services, accessories, and exclusive benefits.",
        ),
      ],
    );
  }

  Widget _infoCard(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }

  /// 🔹 BAR DATA
  List<BarChartGroupData> _barGroups() {
    final earned = [1200, 950, 1400, 700, 1100, 900];
    final redeemed = [350, 600, 400, 200, 750, 400];

    return List.generate(6, (i) {
      return BarChartGroupData(
        x: i,
        barsSpace: 6,
        barRods: [
          BarChartRodData(toY: earned[i].toDouble(), width: 10, color: Colors.blue),
          BarChartRodData(toY: redeemed[i].toDouble(), width: 10, color: Colors.red),
        ],
      );
    });
  }

  /// 🔹 BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Points", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: sections.map((e) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: e,
        )).toList(),
      ),
      bottomNavigationBar: const MobileBottomNav(),
    );
  }
}
