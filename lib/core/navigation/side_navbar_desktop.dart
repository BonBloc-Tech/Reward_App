import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/auth/view/login_desktop_view.dart';
import 'package:sm_reward_app/features/benefits/view/benefits_desktop_view.dart';
import 'package:sm_reward_app/features/calculation/view/calculation_desktop_view.dart';
import 'package:sm_reward_app/features/dashboard/view/dashboard_desktop_view.dart';
import 'package:sm_reward_app/features/history/view/history_desktop_view.dart';
import 'package:sm_reward_app/features/points/view/points_desktop_view.dart';

class SideMenuLayout extends StatefulWidget {
  final int initialIndex; 
  const SideMenuLayout({
    super.key,
    this.initialIndex = 0, 
  });

  @override
  State<SideMenuLayout> createState() => _SideMenuLayoutState();
}
class _SideMenuLayoutState extends State<SideMenuLayout> {
  late int selectedIndex; 

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }


  final List<String> labels = [
    "Dashboard",
    "Points",
    "History",
    "Benefits",
    "Calculation",
    "Logout",
    // "Admin"
      ];

  final List<String> icons = [
    'assets/logo/home_icon.png',
    'assets/logo/points_icon.png',
    'assets/logo/history_icon.png',
    'assets/logo/benefits_icon.png',
    'assets/logo/calculation_icon.png',
    'assets/logo/logout_icon.png',
    // 'assets/logo/home_icon.png',
  ];
  

  final List<Widget> screens = [
   DashboardPage(
   
  ),
    PointsScreen(),
    HistoryPage(),
    BenefitsDesktopView(),
    PointsCalculationPage(), 
    Container(), 
    // AdminDashboardView(),
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
    // AdminDashboardView(),
  ];

  return Scaffold(
    body: Row(
      children: [
       
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
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
      builder: (_) => LoginPage(), // replace with your login page
    ),
    (route) => false, // remove all previous routes
  );
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
