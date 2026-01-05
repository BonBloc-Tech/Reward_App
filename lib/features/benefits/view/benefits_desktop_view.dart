import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import 'package:sm_reward_app/core/global_widgets/tier_progress_card.dart';
import 'package:sm_reward_app/core/navigation/side_navbar_desktop.dart';
import '../controller/benefits_controller.dart';
import '../widget/benefits_widget.dart';
class BenefitsDesktopView extends StatelessWidget {
  const BenefitsDesktopView({super.key});

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
                const GlobalAppBar(title: "Benefits"),
                
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TierProgressCard(),
                          const SizedBox(height: 24),

                          const Text(
                            "Available Benefits",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Obx(
                            () => ListView.separated(
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.benefitsList.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(),
                              itemBuilder: (_, index) {
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
