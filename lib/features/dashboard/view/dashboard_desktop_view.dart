import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import 'package:sm_reward_app/features/Account/view/account_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/donutcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/recentactivity_widget.dart';


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
        return const DonutcardWidget();

      case 'recent':
        return const RecentactivityWidget();

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
}