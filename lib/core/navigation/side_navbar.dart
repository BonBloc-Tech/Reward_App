import 'package:flutter/material.dart';
 
class SideMenu extends StatelessWidget {
  const SideMenu({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 24),
 
          /// 🔵 APP LOGO
          Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Image.asset(
              'assets/logo/app_logo.png',
              fit: BoxFit.contain,
            ),
          ),
 
          const SizedBox(height: 42),
 
          /// 🧭 MENU ITEMS
          _menuItem(
            label: "Home",
            assetPath: 'assets/logo/home_icon.png',
          ),
          _menuItem(
            label: "Points",
            assetPath: 'assets/logo/points_icon.png',
          ),
          _menuItem(
            label: "History",
            assetPath: 'assets/logo/history_icon.png',
          ),
          _menuItem(
            label: "Benefits",
            assetPath: 'assets/logo/benefits_icon.png',
          ),
          _menuItem(
            label: "Calculation",
            assetPath: 'assets/logo/calculation_icon.png',
            size: 30,
          ),
 
          const Spacer(),
 
          /// 🚪 LOGOUT
          _menuItem(
            label: "Logout",
            assetPath: 'assets/logo/logout_icon.png',
          ),
 
          const SizedBox(height: 28),
        ],
      ),
    );
  }
 
  /// ✅ ICON + LABEL (VERTICAL)
  Widget _menuItem({
    required String label,
    required String assetPath,
    double size = 22,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            assetPath,
            width: size,
            height: size,
            color: Colors.white,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
 