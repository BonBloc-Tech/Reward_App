import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/benefits/view/benefits_desktop_view.dart';
import 'package:sm_reward_app/features/calculation/view/calculation_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_desktop_view.dart';
import 'package:sm_reward_app/features/history/view/history_desktop_view.dart';
import 'package:sm_reward_app/features/points/view/points_desktop_view.dart';

class SideMenuLayout extends StatefulWidget {
  const SideMenuLayout({super.key});

  @override
  State<SideMenuLayout> createState() => _SideMenuLayoutState();
}

class _SideMenuLayoutState extends State<SideMenuLayout> {
  int selectedIndex = 0;

  final List<String> labels = [
    "Dashboard",
    "Points",
    "History",
    "Benefits",
    "Calculation",
    "Logout"
  ];

  final List<String> icons = [
    'assets/logo/home_icon.png',
    'assets/logo/points_icon.png',
    'assets/logo/history_icon.png',
    'assets/logo/benefits_icon.png',
    'assets/logo/calculation_icon.png',
    'assets/logo/logout_icon.png',
  ];
  void setSelectedIndex(int index) {
  setState(() {
    selectedIndex = index;
  });
}

  final List<Widget> screens = [
   DashboardPage(
   
  ),
    PointsScreen(),
    HistoryPage(),
    BenefitsDesktopView(),
    PointsCalculationPage(), 
    Container(), 
  ];

 @override
Widget build(BuildContext context) {
  final screens = [
    DashboardPage(
     
    ),
    PointsScreen(),
    HistoryPage(),
    BenefitsDesktopView(),
    PointsCalculationPage(),
    Container(),
  ];

  return Scaffold(
    body: Row(
      children: [
        /// SIDE MENU
        Container(
          width: 72,
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Image.asset('assets/logo/app_logo.png', width: 40),
              const SizedBox(height: 42),
              ...List.generate(labels.length, (index) {
                final isSelected = selectedIndex == index;
                return _menuItem(
                  label: labels[index],
                  assetPath: icons[index],
                  isSelected: isSelected,
                  onTap: () {
                    if (labels[index] == "Logout") {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    } else {
                      setState(() {
                        selectedIndex = index;
                      });
                    }
                  },
                  size: labels[index] == "Calculation" ? 30 : 22,
                );
              }),
              const Spacer(),
              const SizedBox(height: 28),
            ],
          ),
        ),

        /// CONTENT
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

  /// 🔹 MENU ITEM WIDGET
  Widget _menuItem({
    required String label,
    required String assetPath,
    required VoidCallback onTap,
    required bool isSelected,
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
