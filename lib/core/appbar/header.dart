import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/features/Account/view/account_desktop_view.dart';

class GlobalAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const GlobalAppBar({
    super.key,
    required this.title,
    this.showBackButton = false, // default: no back button
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

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
          /// 🔙 BACK BUTTON (if enabled)
          if (showBackButton)
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(20),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back, size: 24),
              ),
            ),

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
