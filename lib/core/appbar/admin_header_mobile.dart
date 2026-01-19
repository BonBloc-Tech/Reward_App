import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sm_reward_app/core/global_widgets/custom_alertbox.dart';
import 'package:sm_reward_app/core/global_widgets/snack_bar.dart';
import 'package:sm_reward_app/features/auth/view/login_mobile_view.dart';

class AdminHeaderMobile extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AdminHeaderMobile({super.key, required this.title});

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
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
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
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF20304A),
              ),
            ),
          ),
          _circleIcon(
            icon: Icons.logout,
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => CustomAlertDialog(
                  title: "Logout",
                  message: "Are you sure you want to exit this app?",
                  onConfirm: () {
                    Get.back();
                    AppSnackBar.success(message: "Logged out successfully");

                    Get.offAll(() => LoginPageMobile());
                  },

                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },

            isDarkMode: isDarkMode,
          ),
        ],
      ),
    );
  }


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
          color: isDarkMode ? Colors.grey.shade900 : const Color(0xFFF1F3F6),
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
