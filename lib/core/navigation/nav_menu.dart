import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sm_reward_app/core/global_widgets/custom_alertbox.dart';
import 'package:sm_reward_app/core/global_widgets/snack_bar.dart';
import 'package:sm_reward_app/features/admin/view/admin_dashboard_view.dart';
import 'package:sm_reward_app/features/auth/view/login_desktop_view.dart';

class NavMenuLayout extends StatefulWidget {
  const NavMenuLayout({super.key});

  @override
  State<NavMenuLayout> createState() => _NavMenuLayoutState();
}

class _NavMenuLayoutState extends State<NavMenuLayout> {
  int selectedIndex = 0;

  final List<String> labels = [
    "Home",
    
    "Logout",
  ];

  final List<String> icons = [
    'assets/logo/home_icon.png',
    
    'assets/logo/logout_icon.png',
  ];

  final List<Widget> screens = [
    AdminDashboardView(),
   
    Container(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// SIDEBAR
          Container(
            width: 72,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 24),
                Image.asset('assets/logo/app_logo.png', width: 40),
                const SizedBox(height: 42),

                /// MENU ITEMS
                ...List.generate(labels.length, (index) {
                  final isSelected = selectedIndex == index;
                  return _menuItem(
                    label: labels[index],
                    assetPath: icons[index],
                    isSelected: isSelected,
                     onTap: () {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  title: "Logout",
                  message: "Are you sure you want to exit this app?",
                  onConfirm: () {
                    Get.back();
                    AppSnackBar.success(message: "Logged out successfully");

                    Get.offAll(() => LoginPage());
                  },

                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
                  );
                }),

                const Spacer(),
                const SizedBox(height: 28),
              ],
            ),
          ),

          /// MAIN CONTENT
          Expanded(
            child: IndexedStack(
              index: selectedIndex,
              children: screens,
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem({
    required String label,
    required String assetPath,
    required bool isSelected,
    required VoidCallback onTap,
    double size = 22,
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
              color: isSelected ? Colors.blue : Colors.white70,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.blue : Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
