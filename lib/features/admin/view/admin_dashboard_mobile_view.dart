import 'package:flutter/material.dart';
import 'package:sm_reward_app/core/appbar/admin_header_mobile.dart';
import 'package:sm_reward_app/features/admin/widget/points_summary_mobile.dart';
import '../controller/admin_controller.dart';
import '../widget/customer_search_bar.dart';
import '../widget/reward_table.dart';
import '../widget/customer_info_card.dart';
import '../widget/vehicle_info_card.dart';


class AdminDashboardMobileView extends StatelessWidget {
  const AdminDashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AdminController();
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

     appBar: AdminHeaderMobile(
  title: "Dashboard",
),

      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [           
            CustomerSearchBar(
              customers: controller.customers,
            ),
            const SizedBox(height: 16),           
            CustomerInfoCard(
              customer: controller.selectedCustomer,
            ),
            const SizedBox(height: 16), 
            VehicleInfoCard(
              customer: controller.selectedCustomer,
            ),
            const SizedBox(height: 24),
            const PointsSummaryRowMobile(),
            const SizedBox(height: 24),
            const Text(
              'Associated Reward Points',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),
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
