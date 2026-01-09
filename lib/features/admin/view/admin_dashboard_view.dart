import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/admin/controller/admin_controller.dart';
import '../../../core/global_widgets/nav_menu.dart';
import '../widget/customer_search_bar.dart';
import '../widget/customer_vehicle_section.dart';
import '../widget/points_summary_row.dart';
import '../widget/reward_table.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Row(
        children: [
       

          /// 🔹 MAIN CONTENT AREA
          Expanded(
            child: Column(
              children: [
                /// 🔹 TOP HEADER / APP BAR
                Container(
                  height: 64,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Admin Dashboard',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/logo/profile_logo.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Admin',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                /// 🔹 BODY
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        width: 1150,
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// 🔹 DASHBOARD TITLE
                            
                            const SizedBox(height: 20),

                            /// 🔹 CUSTOMER SEARCH
                            CustomerSearchBar(
                              customers: controller.customers,
                            ),
                            const SizedBox(height: 20),

                            /// 🔹 CUSTOMER + VEHICLE INFO
                            CustomerVehicleSection(
                              customer: controller.selectedCustomer,
                            ),
                            const SizedBox(height: 20),

                            /// 🔹 POINTS SUMMARY
                            const PointsSummaryRow(),
                            const SizedBox(height: 24),

                             const Text(
                            'Associated Reward Points',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 24),

                            /// 🔹 REWARDS TABLE
                            RewardTable(
                              rewards: controller.rewards,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
