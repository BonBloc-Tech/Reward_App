import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sm_reward_app/core/navigation/side_navbae_mob.dart';

import '../controller/benefits_controller.dart';

import '../../../core/global_widgets/tier_progress_card.dart';

class BenefitsScreenMobile extends StatelessWidget {
  const BenefitsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BenefitsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Benefits",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundImage:
                  AssetImage('assets/images/profile_logo.png'),
            ),
          ),
        ],
      ),

      /// ================= BODY =================
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ================= TIER PROGRESS =================
            const TierProgressCard(),

            const SizedBox(height: 28),

            /// ================= TITLE =================
            const Text(
              "Available Benefits",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            /// ================= BENEFITS LIST =================
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.benefitsList.length,

                /// 🔹 DIVIDER BETWEEN ITEMS
                separatorBuilder: (_, __) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ),

                itemBuilder: (context, index) {
                  final item = controller.benefitsList[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// BENEFIT TITLE
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// BENEFIT DESCRIPTION
                      Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.6,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      /// ================= BOTTOM NAV =================
      // bottomNavigationBar: const Side_Menu(),
    );
  }
}
