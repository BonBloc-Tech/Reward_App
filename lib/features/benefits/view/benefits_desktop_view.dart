import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import 'package:sm_reward_app/core/global_widgets/tier_progress_card.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';
import '../controller/benefits_controller.dart';
import '../widget/benefits_widget.dart';

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
         GlobalAppBar(title:  "Benefits"),
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
        
        
      
    );
  }
}
