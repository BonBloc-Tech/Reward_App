import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_mobile.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/donutcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/recentactivity_widget.dart';

class DashboardMobilePage extends StatefulWidget {
  const DashboardMobilePage({super.key});

  @override
  State<DashboardMobilePage> createState() => _DashboardMobilePageState();
}

class _DashboardMobilePageState extends State<DashboardMobilePage> {
  final List<String> sections = [
    'available',
    'membership',
    'earned',
    'redeemed',
    'donut',
    'recent',
  ];

  Widget buildSection(String id) {
    switch (id) {
      case 'available':
        return const BuildPointCard(
          title: "Available Points",
          value: "12,000",
          color: Colors.deepPurple,
        );

      case 'membership':
        return const BuildMembershipCard(
          title: "Membership Level",
          level: "Gold",
          percent: 0.83,
        );

      case 'earned':
        return const BuildPointCard(
          title: "Total Earned Points",
          value: "18,000",
          color: Colors.blue,
        );

      case 'redeemed':
        return const BuildPointCard(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ReorderableListView.builder(
            itemCount: sections.length,
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (newIndex > oldIndex) newIndex--;
                final item = sections.removeAt(oldIndex);
                sections.insert(newIndex, item);
              });
            },
            itemBuilder: (context, index) {
              final id = sections[index];
              return Card(
                key: ValueKey(id),
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    /// Drag Handle
                    Align(
                      alignment: Alignment.topRight,
                      child: ReorderableDragStartListener(
                        index: index,
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.drag_handle),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: buildSection(id),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const MobileBottomNav(),
    );
  }
}
