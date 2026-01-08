import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/donutcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/recentdesktopwidget.dart';
import 'package:sm_reward_app/features/history/view/history_desktop_view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  /// ONLY 3 DRAGGABLE CONTAINERS
  Map<String, String> layout = {
    'left': 'points',
    'right': 'donut',
    'bottom': 'recent',
  };

  void swap(String from, String to) {
    setState(() {
      final temp = layout[from];
      layout[from] = layout[to]!;
      layout[to] = temp!;
    });
  }

  /// ---------- LEFT GROUP (COMPACT – FIGMA STYLE) ----------
  Widget buildPointsContainer() {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 360, // SAME HEIGHT AS OVERALL REPORT
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Available Points",
                  value: "12,000",
                  color: const Color.fromARGB(255, 48, 140, 232),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: BuildMembershipCard(
                  title: "Membership Level",
                  level: "Gold",
                  percent: 0.83,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Total Earned Points",
                  value: "18,000",
                  color: const Color.fromARGB(255, 173, 121, 241),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: BuildPointCard(
                  title: "Total Redeemed Points",
                  value: "6,000",
                  color: const Color.fromARGB(255, 48, 140, 232),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------- CARD BUILDER ----------
  Widget buildCard(String id) {
    switch (id) {
      case 'points':
        return buildPointsContainer();

      case 'donut':
        return const DonutcardWidget();

      case 'recent':
        return RecentActivityDesktopWidget(
          onViewPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HistoryPage(),
              ),
            );
          },
        );

      default:
        return const SizedBox();
    }
  }

  /// ---------- DRAG BOX ----------
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
            width: 420,
            height: height,
            child: buildCard(id),
          ),
        ),
        childWhenDragging: Opacity(
          opacity: 0.4,
          child: buildCard(id),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(height: height, child: buildCard(id)),

            /// DRAG ICON – FIGMA STYLE
            Positioned(
              top: -8,
              left: -8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.drag_indicator,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ---------- UI ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: GlobalAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            /// TOP SECTION – PERFECT ROW ALIGN
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: dragBox('left', height: 250),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: dragBox('right', height: 250),
                ),
              ],
            ),

            const SizedBox(height: 28),

            /// BOTTOM RECENT ACTIVITY
            dragBox('bottom'),
          ],
        ),
      ),
    );
  }
}
