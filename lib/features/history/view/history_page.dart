import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbar.dart';
import '../controller/history_controller.dart';
import '../widget/history_table.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HistoryController());

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
                        "History",
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

                /// 🔹 BODY
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14),
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
                                    decoration: const InputDecoration(
                                      hintText: "Search transactions",
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
                              Obx(() => _FilterButton(
                                    text: "All Transactions",
                                    selected:
                                        !controller.isLast30Days.value,
                                    onTap: () => controller
                                        .toggleLast30Days(false),
                                  )),
                              const SizedBox(width: 10),
                              Obx(() => _FilterButton(
                                    text: "Last 30 Days",
                                    selected:
                                        controller.isLast30Days.value,
                                    onTap: () =>
                                        controller.toggleLast30Days(true),
                                  )),
                            ],
                          ),

                          const SizedBox(height: 24),

                          /// 📊 TABLE (SEPARATE WIDGET)
                          const HistoryTable(),
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

/// 🔘 FILTER BUTTON
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
              style: TextStyle(
                fontSize: 13,
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
