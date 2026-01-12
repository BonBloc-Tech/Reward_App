import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/appbar/header_mobile.dart';
import 'package:sm_reward_app/features/dashboard/widget/donutcard_widget.dart';
import 'package:sm_reward_app/features/dashboard/widget/pointswidget.dart';
import 'package:sm_reward_app/features/dashboard/widget/recentactivity_widget.dart';
 
class DashboardMobilePage extends StatefulWidget {
  const DashboardMobilePage({super.key});
 
  @override
  State<DashboardMobilePage> createState() => _DashboardMobilePageState();
}
 
class _DashboardMobilePageState extends State<DashboardMobilePage> {
 
 
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF5F6FA),
    appBar: const GlobalAppBarMobile(
      title: "Dashboard",
      showBack: false,
    ),
    body: Column(
      children: [
       
 Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Pointswidget (),
                const SizedBox(height: 16),
               
                const SizedBox(height: 16),
                const DonutcardWidget(),
                const SizedBox(height: 16),
                const RecentactivityWidget(),
              ],
            ),  
 )
           
        ),
      ],
    ),
// bottomNavigationBar: MobileBottomNav(),
  );
}
}
 