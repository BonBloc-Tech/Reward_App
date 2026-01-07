import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/global_widgets/header_mobile.dart';
import 'package:sm_reward_app/features/dashboard/widget/donutcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/pointswidget.dart';
import 'package:sm_reward_app/features/dashboard/widget/recentactivity_widget.dart';

class DashboardMobilePage extends StatefulWidget {
  const DashboardMobilePage({super.key});

  @override
  State<DashboardMobilePage> createState() => _DashboardMobilePageState();
}

class _DashboardMobilePageState extends State<DashboardMobilePage> {
  final List<Widget> _sections = [
    const Pointswidget(key: ValueKey('points')),
    const DonutcardWidget(key: ValueKey('donut')),
    const RecentactivityWidget(key: ValueKey('recent')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: const GlobalAppBarMobile(
        title: 'Dashboard',
      ),

      body: ReorderableListView(
        padding: const EdgeInsets.all(16),
        onReorder: _onReorder,
        children: List.generate(_sections.length, (index) {
          return SizedBox(
            key: _sections[index].key!,
            width: double.infinity, // 🔥 IMPORTANT
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _sections[index],
            ),
          );
        }),
      ),
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _sections.removeAt(oldIndex);
      _sections.insert(newIndex, item);
    });
  }
}
