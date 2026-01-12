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
 
    return Container(

      height: preferredSize.height + statusBarHeight,

      padding: EdgeInsets.fromLTRB(12, statusBarHeight + 12, 12, 12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: const BorderRadius.vertical(

          bottom: Radius.circular(18),

        ),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(0.08),

            blurRadius: 8,

            offset: const Offset(0, 3),

          ),

        ],

      ),
 
      child: Row(

        children: [

          /// 🔙 BACK BUTTON

          if (showBack)

            _circleIcon(

              icon: Icons.arrow_back,

              onTap: () => Get.back(),

              isDarkMode: isDarkMode,

            )

          else

            const SizedBox(width: 36),
 
          const SizedBox(width: 6),
 
          /// 🏷 TITLE

          Expanded(

            child: Text(

              title,

              textAlign: TextAlign.center,

              style: AppTextStyles.titleSmall(context).copyWith(

                color: const Color(0xFF20304A),

                fontWeight: FontWeight.w700,

              ),

              maxLines: 1,

              overflow: TextOverflow.ellipsis,

            ),

          ),
 
          const SizedBox(width: 6),
 
          /// 👤 PROFILE

          _circleIcon(

            icon: Icons.person,

            onTap: onProfileTap ??

                () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const AccountPageMobile(),

                    ),

                  );

                },

            isDarkMode: isDarkMode,

          ),

        ],

      ),

    );

  }
 
  /// 🔘 COMMON CIRCLE ICON

  Widget _circleIcon({

    required IconData icon,

    required VoidCallback onTap,

    required bool isDarkMode,

  }) {

    return InkWell(

      onTap: onTap,

      borderRadius: BorderRadius.circular(20),

      child: Container(

        width: 32,

        height: 32,

        decoration: BoxDecoration(

          shape: BoxShape.circle,

          color: isDarkMode

              ? Colors.grey.shade900

              : const Color(0xFFF1F3F6),

        ),

        child: Icon(

          icon,

          size: 16,

          color: isDarkMode ? Colors.white : Colors.black,

        ),

      ),

     );

  }

}

 