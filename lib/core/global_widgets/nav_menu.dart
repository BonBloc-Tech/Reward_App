import 'package:flutter/material.dart';
// import 'package:sm_reward_app/features/benefits/view/benefits_page.dart';
// import 'package:sm_reward_app/features/calculation/view/points_calculation_page.dart';
// import 'package:sm_reward_app/features/history/view/history_page.dart';
// import 'package:sm_reward_app/features/points/view/points_screen.dart';



// 🔹 Import your pages


class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

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
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (_) => const HomePage()),
              // );
            },
          ),

         

         


         
          const Spacer(),

          /// 🚪 LOGOUT
          _menuItem(
            label: "Logout",
            assetPath: 'assets/logo/logout_icon.png',
            onTap: () {
             
            },
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
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
