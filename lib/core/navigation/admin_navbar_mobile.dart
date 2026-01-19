import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/features/admin/view/admin_dashboard_mobile_view.dart';
import 'package:sm_reward_app/features/auth/view/login_mobile_view.dart';


class MobileBottomNav1 extends StatefulWidget {
  final int initialIndex;

  const MobileBottomNav1({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MobileBottomNav1> createState() => _MobileBottomNavState();
}

class _MobileBottomNavState extends State<MobileBottomNav1> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    AdminDashboardMobileView(),
  ];

  final List<_NavItem> _items = const [
    _NavItem("Home", "assets/logo/home_icon.png"),
    // _NavItem("Logout", "assets/logo/logout_icon.png"),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: const BoxDecoration(
        color: Colors.white,
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
        if (_items[index].label == "Logout") {
          Get.offAll(() =>  LoginPageMobile());
          return;
        }

        setState(() => _currentIndex = index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? const Color(0xFF2563EB).withOpacity(0.15)
                  : Colors.transparent,
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                isSelected
                    ? const Color(0xFF2563EB)
                    : Colors.blueGrey,
                BlendMode.srcIn,
              ),
              child: Image.asset(
                _items[index].icon,
                width: 22,
                height: 22,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _items[index].label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected
                  ? const Color(0xFF2563EB)
                  : Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final String label;
  final String icon;

  const _NavItem(this.label, this.icon);
}
