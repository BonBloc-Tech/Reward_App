import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/benefits/view/benefits_page_mobile.dart';
import 'package:sm_reward_app/features/calculation/view/calculation_mobile_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_mobile_view.dart';
import 'package:sm_reward_app/features/history/view/history_mobile_view.dart';
import 'package:sm_reward_app/features/points/view/points_mobile_view.dart';


class MobileBottomNav extends StatefulWidget {
  const MobileBottomNav({super.key});

  @override
  State<MobileBottomNav> createState() => _MobileBottomNavState();
}

class _MobileBottomNavState extends State<MobileBottomNav> {
  int _currentIndex = 1; // Points default

  final List<_NavItem> _items = const [
    _NavItem("Home", "assets/logo/home_icon.png"),
    _NavItem("Points", "assets/logo/points_icon.png"),
    _NavItem("History", "assets/logo/history_icon.png"),
    _NavItem("Benefits", "assets/logo/benefits_icon.png"),
    _NavItem("Calculation", "assets/logo/calculation_icon.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 179, 181, 183),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          _items.length,
          (index) => _buildNavItem(index),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (_currentIndex == index) return;

        setState(() => _currentIndex = index);

        /// 🔥 PAGE NAVIGATION
        switch (index) {
          case 0:
             Get.offAll(() => const DashboardMobilePage());
            break;

          
          case 1:
            Get.offAll(() => const PointsScreenMobile());
            break;

          case 2:
            Get.offAll(() =>  MobileHistoryList());
            break;

          case 3:
            Get.offAll(() => const BenefitsScreenMobile());
            break;

          case 4:
            Get.offAll(() => const PointsCalculationScreenMobile());
            break;

            
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            child: Image.asset(
              _items[index].icon,
              width: 22,
              height: 22,
              color: isSelected
                  ? const Color(0xFF2563EB)
                  : Colors.black54,
            ),
          ),

          const SizedBox(height: 4),

          /// LABEL
          Text(
            _items[index].label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? const Color(0xFF2563EB)
                  : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 MODEL
class _NavItem {
  final String label;
  final String icon;

  const _NavItem(this.label, this.icon);
}
