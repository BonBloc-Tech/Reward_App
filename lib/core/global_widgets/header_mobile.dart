import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return SafeArea(
      bottom: false,
      child:Container(
  height: 56,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: isDarkMode
          ? [
              const Color(0xFF1F1F1F),
              const Color(0xFF2C2C2C),
            ]
          : [
              const Color.fromARGB(255, 127, 40, 220),
              const Color(0xFF2575FC),
            ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(16),
    ),
    boxShadow: [
      BoxShadow(
        // ignore: deprecated_member_use
        color: Colors.black.withOpacity(0.15),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  ),

        child: Row(
          children: [
            /// Title
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.titleSmall(context).copyWith(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),

            /// Profile
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPageMobile(),
                ),
              ),
              borderRadius: BorderRadius.circular(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor:
                        isDarkMode ? Colors.blueGrey : Colors.white,
                    child: const Icon(
                      Icons.person,
                      size: 12,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(width: 6),

                  if (screenWidth > 320)
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 110),
                      // child: Text(
                      //   'BHARAT KALRA & CO',
                      //   style:
                      //       AppTextStyles.bodySmall(context).copyWith(
                      //     color: isDarkMode
                      //         ? Colors.white
                      //         : const Color(0xFF20304A),
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      //   maxLines: 1,
                      //   overflow: TextOverflow.ellipsis,
                      // ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
