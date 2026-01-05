import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import 'package:sm_reward_app/features/Account/view/account_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  
  Map<String, String> layout = {
    'left1': 'available',
    'left2': 'membership',
    'left3': 'earned',
    'left4': 'redeemed',
    'right': 'donut',
    'bottom': 'recent',
  };

  void swap(String fromKey, String toKey) {
    setState(() {
      final temp = layout[fromKey];
      layout[fromKey] = layout[toKey]!;
      layout[toKey] = temp!;
    });
  }

  Widget buildCard(String id) {
    switch (id) {
      case 'available':
        return BuildPointCard(
            title: "Available Points",
            value: "12,000",
            color: Colors.deepPurple);

      case 'membership':
        return BuildMembershipCard(
            title: "Membership Level",
            level: "Gold",
            percent: 0.83);

      case 'earned':
        return BuildPointCard(
            title: "Total Earned Points",
            value: "18,000",
            color: Colors.blue);

      case 'redeemed':
        return BuildPointCard(
            title: "Total Redeemed Points",
            value: "6,000",
            color: Colors.pink);

      case 'donut':
        return _donutCard();

      case 'recent':
        return _recentActivityCard();

      default:
        return const SizedBox();
    }
  }

  Widget dragBox(String key, {double? height}) {
    final id = layout[key]!;

    return DragTarget<String>(
      onWillAccept: (from) => from != key,
      onAccept: (from) => swap(from, key),
      builder: (_, __, ___) => Draggable<String>(
        data: key,
        feedback: Material(
          color: Colors.transparent,
          child: SizedBox(
              width: 320,
              height: height,
              child: buildCard(id)),
        ),
        childWhenDragging:
            Opacity(opacity: 0.4, child: buildCard(id)),
        child: SizedBox(
            height: height,
            child: buildCard(id)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Column(
              children: [
                /// TOP BAR
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Dashboard",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      InkWell(
  onTap: () {
    Navigator.push(
      context,
       MaterialPageRoute(
        builder: (_) =>  AccountPage(), 
      ),
    );
  },
  child: const Row(
    children:  [
      CircleAvatar(
        radius: 16,
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.person,
          size: 18,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 8),
      Text(
        "BHARAT KALRA & CO",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          // cursor: MouseCursor.defer, // desktop friendly
        ),
      ),
    ],
  ),
),

                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    child: Column(
                      children: [
                        /// TOP SECTION
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// LEFT
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: dragBox('left1')),
                                      const SizedBox(width: 16),
                                      Expanded(child: dragBox('left2')),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(child: dragBox('left3')),
                                      const SizedBox(width: 16),
                                      Expanded(child: dragBox('left4')),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 16),

                            /// RIGHT DONUT
                            Expanded(
                              flex: 3,
                              child: dragBox('right', height: 360),
                            ),
                          ],
                        ),

                        const SizedBox(height: 24),

                        /// BOTTOM
                        dragBox('bottom'),
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

  /// DONUT CARD (UNCHANGED)
  Widget _donutCard() {
    return Card(
      color: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Overall Report",
                style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200,
                    child: SfCircularChart(
                      series: [
                        DoughnutSeries<_ChartData, String>(
                          radius: '80%',
                          innerRadius: '60%',
                          dataSource: [
                            _ChartData(
                                'Total Earned', 50, Colors.blue),
                            _ChartData(
                                'Total Redeem', 20, Colors.red),
                            _ChartData(
                                'Balance Points', 30, Colors.purple),
                          ],
                          xValueMapper: (d, _) => d.category,
                          yValueMapper: (d, _) => d.value,
                          pointColorMapper: (d, _) => d.color,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _LegendItem(
                        color: Colors.blue, text: "Total Earned"),
                    _LegendItem(
                        color: Colors.red, text: "Total Redeem"),
                    _LegendItem(
                        color: Colors.purple,
                        text: "Balance Points"),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// RECENT ACTIVITY (UNCHANGED)
  Widget _recentActivityCard() {
    return Card(
      color: Colors.white,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Recent Activity",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: () {}, child: const Text("View")),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text("Invoice Id")),
                  DataColumn(label: Text("Date")),
                  DataColumn(label: Text("Activity Type")),
                  DataColumn(label: Text("Credit Amount")),
                  DataColumn(label: Text("Redeem Amount")),
                  DataColumn(label: Text("Balance")),
                  DataColumn(label: Text("Expiry Date")),
                ],
                rows:   [ _dataRow( "INV-456", "12.08.2025", "Car Service", "10,000", "1000", "9000", "12.08.2026"), _dataRow( "INV-879", "01.08.2025", "Service Labour", "20,000", "2000", "18,000", "01.08.2026"),],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
DataRow _dataRow( String invoiceId, String date, String activity, String credit, String redeem, String balance, String expiry, ) { return DataRow( cells: [ DataCell(Text(invoiceId)), DataCell(Text(date)), DataCell(Text(activity)), DataCell(Text(credit)), DataCell(Text(redeem)), DataCell(Text(balance)), DataCell(Text(expiry)), ], ); } 

class _ChartData {
  final String category;
  final double value;
  final Color color;
  _ChartData(this.category, this.value, this.color);
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;
  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}
