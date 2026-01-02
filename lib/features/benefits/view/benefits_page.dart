import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/tier_progress_card.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';
import '../controller/benefits_controller.dart';
import '../widget/benefit_list_tile.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BenefitsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Row(
        children: [
          const SideMenu(),
          Expanded(
            child: Column(
              children: [
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
                        'Benefits',
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
                              'assets/images/profile_logo.png',
                              width: 32,
                              height: 32,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'BHARAT KALRA & CO',
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

                /// ================= BODY =================
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// ================= TIER PROGRESS =================
                          const TierProgressCard(),

                          const SizedBox(height: 28),

                          /// ================= TITLE =================
                          const Text(
                            'Available Benefits',
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
                              separatorBuilder: (_, _) =>
                                  Divider(color: Colors.grey.shade300),
                              itemBuilder: (context, index) {
                                final item =
                                    controller.benefitsList[index];
                                return BenefitListTile(
                                  title: item.title,
                                  description: item.description,
                                );
                              },
                            ),
                          ),
                        ],
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
