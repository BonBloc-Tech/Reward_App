import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
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
          color: Colors.deepPurple,
        );
      case 'membership':
        return BuildMembershipCard(
          title: "Membership Level",
          level: "Gold",
          percent: 0.83,
        );
      case 'earned':
        return BuildPointCard(
          title: "Total Earned Points",
          value: "18,000",
          color: Colors.blue,
        );
      case 'redeemed':
        return BuildPointCard(
          title: "Total Redeemed Points",
          value: "6,000",
          color: Colors.pink,
        );
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
      // ignore: unrelated_type_equality_checks
      onWillAcceptWithDetails: (from) => from != key,
      onAcceptWithDetails: (from) => swap(from as String, key),
      builder: (_, _, _) => Draggable<String>(
        data: key,
        feedback: Material(
          color: Colors.transparent,
          child: SizedBox(
            width: 320,
            height: height,
            child: buildCard(id),
          ),
        ),
        childWhenDragging:
            Opacity(opacity: 0.4, child: buildCard(id)),
        child: SizedBox(
          height: height,
          child: buildCard(id),
        ),
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
                const GlobalAppBar(title: "Dashboard"),

                /// ✅ SCROLL AREA (NO EXPANDED INSIDE)
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 520,
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
                            SizedBox(
                              width: 420,
                              child: dragBox('right', height: 360),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
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
