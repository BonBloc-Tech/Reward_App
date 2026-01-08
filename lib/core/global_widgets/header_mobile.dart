import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/features/Account/view/account_mobile_view.dart';

class GlobalAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onProfileTap;
  final bool showBack;

  const GlobalAppBarMobile({
    super.key,
    required this.title,
    this.onProfileTap,
    this.showBack = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      bottom: false,
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? const [
                    Color(0xFF1F1F1F),
                    Color(0xFF2C2C2C),
                  ]
                : const [
                    Color.fromARGB(255, 127, 40, 220),
                    Color(0xFF2575FC),
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        /// 🔹 APP BAR CONTENT
        child: Row(
          children: [
            /// LEFT SPACE (for optional back button)
            if (showBack)
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            else
              const SizedBox(width: 48),

            /// TITLE
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.titleSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            /// PROFILE ICON
            InkWell(
              onTap: onProfileTap ??
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AccountPageMobile(),
                      ),
                    );
                  },
              borderRadius: BorderRadius.circular(20),
              child: CircleAvatar(
                radius: 16,
                backgroundColor:
                    isDarkMode ? Colors.blueGrey : Colors.white,
                child: const Icon(
                  Icons.person,
                  size: 16,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
