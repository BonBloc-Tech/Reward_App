import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/features/Account/view/account_desktop_view.dart';

class GlobalAppBar extends StatelessWidget {
  final String title;

  const GlobalAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
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
          /// TITLE
          Text(
            title,
            style: AppTextStyles.titleMedium(context).copyWith(
              color: isDarkMode
                  ? Colors.grey.shade900
                  : const Color(0xFF20304A),
              fontWeight: FontWeight.w700,
            ),
          ),

          const Spacer(),

          /// PROFILE → ACCOUNT PAGE
          InkWell(
            onTap: () {
              Get.to(() => const AccountPage());
            },
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'BHARAT KALRA & CO',
                  style: AppTextStyles.bodyMedium(context).copyWith(
                    color: isDarkMode
                        ? Colors.grey.shade900
                        : const Color(0xFF20304A),
                    fontWeight: FontWeight.w700,
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
