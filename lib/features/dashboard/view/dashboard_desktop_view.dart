import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
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

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

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

  /// ---------------- DESKTOP DRAG (UNCHANGED) ----------------
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
              width: 320, height: height, child: buildCard(id)),
        ),
        childWhenDragging:
            Opacity(opacity: 0.4, child: buildCard(id)),
        child: SizedBox(height: height, child: buildCard(id)),
      ),
    );
  }

  /// ---------------- MOBILE: ALL POINTS IN ONE CONTAINER ----------------
  Widget mobilePointsGroup() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: buildCard('available')),
              const SizedBox(width: 12),
              Expanded(child: buildCard('membership')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: buildCard('earned')),
              const SizedBox(width: 12),
              Expanded(child: buildCard('redeemed')),
            ],
          ),
        ],
      ),
    );
  }

  /// ---------------- MOBILE SINGLE DRAG ----------------
  Widget mobileDragBox(String key) {
    final id = layout[key]!;

    return DragTarget<String>(
      onWillAccept: (from) => from != key,
      onAccept: (from) => swap(from, key),
      builder: (_, __, ___) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 6),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: buildCard(id),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Draggable<String>(
                  data: key,
                  feedback: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width:
                          MediaQuery.of(context).size.width - 32,
                      child: buildCard(id),
                    ),
                  ),
                  childWhenDragging: _dragIcon(true),
                  child: _dragIcon(false),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _dragIcon(bool dragging) {
    return CircleAvatar(
      radius: 14,
      backgroundColor:
          dragging ? Colors.grey.shade300 : Colors.grey.shade200,
      child: const Icon(Icons.drag_indicator, size: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          if (!isMobile(context)) const SideMenu(),
          Expanded(
            child: Column(
              children: [
                /// TOP BAR
                Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                
                    children: [
                      GlobalAppBar(title: "Dashboard"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            isMobile(context) ? 16 : 60,
                        vertical: 20),
                    child: isMobile(context)
                        ? Column(
                            children: [
                              /// ✅ ALL POINTS IN ONE CONTAINER
                              mobilePointsGroup(),

                              /// OTHER DRAGGABLE CARDS
                              mobileDragBox('right'),
                              mobileDragBox('bottom'),
                            ],
                          )
                        : Column(
                            children: [
                              /// DESKTOP (UNCHANGED)
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: dragBox(
                                                    'left1')),
                                            const SizedBox(
                                                width: 16),
                                            Expanded(
                                                child: dragBox(
                                                    'left2')),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: dragBox(
                                                    'left3')),
                                            const SizedBox(
                                                width: 16),
                                            Expanded(
                                                child: dragBox(
                                                    'left4')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    flex: 3,
                                    child: dragBox('right',
                                        height: 360),
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
          
        
    
    );
  }
}
