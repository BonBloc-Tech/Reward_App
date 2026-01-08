import 'package:flutter/material.dart';
import 'package:sm_reward_app/features/admin/widget/points_summary_mobile.dart';
import '../controller/admin_controller.dart';
import '../widget/customer_search_bar.dart';
import '../widget/reward_table.dart';
import '../widget/customer_info_card.dart';
import '../widget/vehicle_info_card.dart';
import '../widget/points_summary_row.dart';

class RewardsDashboardMobileView extends StatelessWidget {
  const RewardsDashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = RewardsController();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      /// 🔹 MOBILE APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Admin Dashboard',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade200,
              backgroundImage:
                  const AssetImage('assets/images/profile_logo.png'),
            ),
          ),
        ],
      ),

      /// 🔹 BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 CUSTOMER SEARCH
            CustomerSearchBar(
              customers: controller.customers,
            ),

            const SizedBox(height: 16),

            /// 🔹 CUSTOMER INFO CARD
            CustomerInfoCard(
              customer: controller.selectedCustomer,
            ),

            const SizedBox(height: 16),

            /// 🔹 VEHICLE INFO CARD
            VehicleInfoCard(
              customer: controller.selectedCustomer,
            ),

            const SizedBox(height: 24),

            /// 🔹 POINTS SUMMARY
            const PointsSummaryRowMobile(),

            const SizedBox(height: 24),

            /// 🔹 SECTION TITLE
            const Text(
              'Associated Reward Points',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔹 REWARD TABLE (MOBILE SCROLL)
            SizedBox(
              width: double.infinity,
              child: RewardTable(
                rewards: controller.rewards,
              ),
            ),

            const SizedBox(height: 54),
          ],
        ),
      ),
    );
  }
}
