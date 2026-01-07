import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/header_mobile.dart';

import '../controller/benefits_controller.dart';
import '../../../core/global_widgets/tier_progress_card.dart';

class BenefitsScreenMobile extends StatelessWidget {
  const BenefitsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BenefitsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      /// ✅ GLOBAL APP BAR (STATUS BAR + TITLE + PROFILE)
      appBar: const GlobalAppBarMobile(
        title: "Benefits",
        showBack: false, // no back button on Benefits page
      ),

      /// ✅ BODY CONTENT
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 TIER PROGRESS CARD
            const TierProgressCard(),

            const SizedBox(height: 28),

            /// 🔹 SECTION TITLE
            const Text(
              "Available Benefits",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            /// 🔹 BENEFITS LIST
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.benefitsList.length,
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
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 6),
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
    );
  }
}
