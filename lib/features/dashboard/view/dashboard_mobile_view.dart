import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/global_widgets/header_mobile.dart';
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
  final List<String> cardOrder = [
    'points_group',
    'donut',
    'recent',
  ];
 
  void swap(int from, int to) {
    setState(() {
      final temp = cardOrder[from];
      cardOrder[from] = cardOrder[to];
      cardOrder[to] = temp;
    });
  }
 
  /// ---------------- ALL POINTS IN ONE CONTAINER ----------------
  Widget buildAllPointsContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Points Summary",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
 
          /// Available + Membership
          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Available Points",
                  value: "12,000",
                  color: const Color.fromARGB(255, 165, 124, 236),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BuildMembershipCard(
                  title: "Membership",
                  level: "Gold",
                  percent: 0.83,
                ),
              ),
            ],
          ),
 
          const SizedBox(height: 12),
 
          /// Earned + Redeemed
          Row(
            children: [
              Expanded(
                child: BuildPointCard(
                  title: "Total Earned",
                  value: "18,000",
                  color: const Color.fromARGB(255, 114, 181, 236),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BuildPointCard(
                  title: "Redeemed",
                  value: "6,000",
                  color: const Color.fromARGB(255, 241, 98, 146),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
 
  /// ---------------- SINGLE CARDS ----------------
  Widget buildSingleCard(String id) {
    Widget child;
 
    switch (id) {
      case 'donut':
        child = const DonutcardWidget();
        break;
      case 'recent':
        child = const RecentactivityWidget();
        break;
      default:
        child = const SizedBox();
    }
 
    return child;
  }
 
  /// ---------------- DRAGGABLE CARD ----------------
  Widget draggableCard(int index) {
    final id = cardOrder[index];
 
    return DragTarget<int>(
      onWillAccept: (from) => from != index,
      onAccept: (from) => swap(from!, index),
      builder: (_, __, ___) {
        return Container(
          margin: const EdgeInsets.only(bottom: 18),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: id == 'points_group'
                    ? buildAllPointsContainer()
                    : buildSingleCard(id),
              ),
 
              /// Drag Icon
              Positioned(
                top: 0,
                right: 12,
                child: Draggable<int>(
                  data: index,
                  feedback: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: id == 'points_group'
                          ? buildAllPointsContainer()
                          : buildSingleCard(id),
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
    body: Column(
      children: [
        GlobalAppBarMobile(
          title: 'Dashboard',
          onProfileTap: () {},
        ),
 
        /// ✅ FIX IS HERE
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: cardOrder.length,
            itemBuilder: (_, index) => draggableCard(index),
          ),
        ),
      ],
    ),
bottomNavigationBar: MobileBottomNav(currentIndex: 0,),
  );
}
}
 