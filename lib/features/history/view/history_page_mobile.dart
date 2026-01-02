import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/core/navigation/side_navbae_mob.dart';
import '../controller/history_controller.dart';
import '../widget/history_table.dart';

class MobileHistoryList extends StatelessWidget {
  MobileHistoryList({super.key});

  /// ✅ Controller init (ONLY ONCE)
  final HistoryController controller =
      Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),

      /// 🔹 APP BAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "History",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      /// 🔹 BODY
      body: Column(
        children: [
          /// 🔍 SEARCH
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 44,
              padding:
                  const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: const Color(0xFFDDE3EA)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search,
                      size: 20, color: Colors.grey),
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
          ),

          /// 🔘 FILTER BUTTONS
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Obx(() => _FilterButton(
                      text: "All",
                      selected:
                          !controller.isLast30Days.value,
                      onTap: () =>
                          controller.toggleLast30Days(false),
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
          ),

          const SizedBox(height: 12),

          /// 📄 HISTORY TABLE (REUSED WIDGET)
          const Expanded(
            child: HistoryTable(),
          ),
        ],
      ),

      /// 🔹 BOTTOM NAV
      bottomNavigationBar: const Side_Menu (),
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
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFE0ECFF)
              : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected
                ? const Color(0xFF2563EB)
                : const Color(0xFFDDE3EA),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected
                ? const Color(0xFF2563EB)
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
