import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/appbar/appbar_mob.dart';
import 'package:sm_reward_app/core/navigation/side_navbae_mob.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardMobilePage extends StatefulWidget {
  const DashboardMobilePage({super.key});

  @override
  State<DashboardMobilePage> createState() => _DashboardMobilePageState();
}

class _DashboardMobilePageState extends State<DashboardMobilePage> {
  List<String> sections = ['points', 'donut', 'recent'];

  void reorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = sections.removeAt(oldIndex);
      sections.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: const Color(0xFFF5F6FA),

    /// ✅ APP BAR MUST BE HERE
    appBar: const MobileAppBar(title: "Dashboard"),

    /// ✅ BODY ONLY HERE
    body: Row(
      children: [
        /// SIDE MENU (Desktop only – optional)
        const Side_Menu(),

        /// MAIN CONTENT
        Expanded(
          child: ReorderableListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        onReorder: reorder,
        itemBuilder: (context, index) {
          final id = sections[index];

          return ReorderableDragStartListener(
            key: ValueKey(id),
            index: index,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildSection(id),
            ),
          );
        },
      ),
        ),
      ],
    ),
    );
  }

  Widget _buildSection(String id) {
    switch (id) {
      case 'points':
        return _pointsSection();

      case 'donut':
        return _donutCard();

      case 'recent':
        return _recentActivityCard();

      default:
        return const SizedBox();
    }
  }

  /// 🔹 POINTS SECTION
  Widget _pointsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Points Overview",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          children: const [
            BuildPointCard(
              title: "Available Points",
              value: "12,000",
              color: Colors.deepPurple,
            ),
            BuildMembershipCard(
              title: "Membership Level",
              level: "Gold",
              percent: 0.83,
            ),
            BuildPointCard(
              title: "Total Earned",
              value: "18,000",
              color: Colors.blue,
            ),
            BuildPointCard(
              title: "Total Redeemed",
              value: "6,000",
              color: Colors.pink,
            ),
          ],
        ),
      ],
    );
  }

  /// 🔹 DONUT CARD
  Widget _donutCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Overall Report",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: SfCircularChart(
                series: [
                  DoughnutSeries<_ChartData, String>(
                    radius: '85%',
                    innerRadius: '65%',
                    dataSource: [
                      _ChartData('Earned', 50, Colors.blue),
                      _ChartData('Redeemed', 20, Colors.red),
                      _ChartData('Balance', 30, Colors.purple),
                    ],
                    xValueMapper: (d, _) => d.label,
                    yValueMapper: (d, _) => d.value,
                    pointColorMapper: (d, _) => d.color,
                    dataLabelSettings:
                        const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 RECENT ACTIVITY
  Widget _recentActivityCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Activity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20,
                columns: const [
                  DataColumn(label: Text("Invoice")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Type")),
                  DataColumn(label: Text("Amount")),
                  DataColumn(label: Text("Balance")),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text("INV-123")),
                      DataCell(Text("10-01-2026")),
                      DataCell(Text("Purchase")),
                      DataCell(Text("10,000")),
                      DataCell(Text("8,000")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 CHART DATA
class _ChartData {
  final String label;
  final double value;
  final Color color;
  _ChartData(this.label, this.value, this.color);
}
