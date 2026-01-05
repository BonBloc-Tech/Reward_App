import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_mobile_view.dart';
class SideNavbarMobile extends StatelessWidget {
  const SideNavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 72,
      backgroundColor: Colors.black,
      child: Column(
        children: [
          const SizedBox(height: 24),

          /// APP LOGO
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

          _menuItem(
            label: "Home",
            assetPath: 'assets/logo/home_icon.png',
            onTap: () {},
          ),

          _menuItem(
            label: "Points",
            assetPath: 'assets/logo/points_icon.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardPage()),
              );
            },
          ),

          _menuItem(
            label: "History",
            assetPath: 'assets/logo/history_icon.png',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DashboardMobilePage()),
              );
            },
          ),

          const Spacer(),

          _menuItem(
            label: "Logout",
            assetPath: 'assets/logo/logout_icon.png',
            onTap: () {},
          ),

          const SizedBox(height: 28),
        ],
      ),
    );
  }

  Widget _menuItem({
    required String label,
    required String assetPath,
    double size = 22,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
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
      ),
    );
  }
}
