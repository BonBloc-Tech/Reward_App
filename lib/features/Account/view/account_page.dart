import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildmembercard.dart';
import 'package:sm_reward_app/features/dashboard/widget/buildpointcard.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Column(
              children: [
                /// TOP BAR
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Account",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    InkWell(
  onTap: () {
    Navigator.push(
      context,
       MaterialPageRoute(
        builder: (_) => const AccountPage(), // 👈 your profile page
      ),
    );
  },
  child: const Row(
    children: const [
      CircleAvatar(
        radius: 16,
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.person,
          size: 18,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 8),
      Text(
        "BHARAT KALRA & CO",
        style: TextStyle(
          fontWeight: FontWeight.w600,
         // desktop friendly
        ),
      ),
    ],
  ),
),

                    ],
                  ),
                ),

               
        ],
      ),
          ),
        ],
      
      ),
    );
  }

 