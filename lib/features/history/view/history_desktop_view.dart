import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/core/global_widgets/header.dart';
import '../controller/history_controller.dart';
import '../widget/history_table_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: GlobalAppBar(title: 'History'),
      body: Row(
        children: [
         
          
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
                          /// 🔍 SEARCH BAR
                          Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFDDE3EA),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    onChanged: controller.onSearch,
                                    style:
                                        AppTextStyles.bodyMedium(context),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Search transactions",
                                      hintStyle:
                                          AppTextStyles.bodySmall(
                                        context,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          /// 🔘 FILTER BUTTONS
                          Row(
                            children: [
                              Obx(
                                () => _FilterButton(
                                  text: "All Transactions",
                                  selected: !controller
                                      .isLast30Days.value,
                                  onTap: () => controller
                                      .toggleLast30Days(false),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Obx(
                                () => _FilterButton(
                                  text: "Last 30 Days",
                                  selected: controller
                                      .isLast30Days.value,
                                  onTap: () => controller
                                      .toggleLast30Days(true),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 24),

                          /// 🔹 HISTORY TABLE
                          const HistoryTable(),
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

/// 🔘 FILTER BUTTON (AppTextStyles applied)
class _FilterButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const _FilterButton({
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? const Color.fromARGB(255, 199, 224, 249)
              : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected
                ? const Color.fromARGB(255, 199, 224, 249)
                : const Color(0xFFDDE3EA),
          ),
        ),
        child: Row(
          children: [
            if (selected)
              const Icon(
                Icons.check,
                size: 16,
                color: Color(0xFF2563EB),
              ),
            if (selected) const SizedBox(width: 6),
            Text(
              text,
              style: AppTextStyles.bodySmall(
                context,
                fontWeight: FontWeight.w600,
                color: selected
                    ? const Color(0xFF2563EB)
                    : const Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
