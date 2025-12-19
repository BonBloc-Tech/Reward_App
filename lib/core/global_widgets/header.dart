import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_reward_app/config/textstyle.dart';
import 'package:sm_reward_app/core/global_widgets/custom_alertbox.dart';



class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final LoginController loginController = Get.find<LoginController>();

  GlobalAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    // final employeeModel = loginController.employeeModel;
    // final String email = employeeModel.emailId ?? 'user@example.com';
    //  final String username = employeeModel.customerName ?? 'Username';

    // Theme-based colors
    final Color appBarBg = isDark ? Colors.white : Colors.black;
    final Color textColor = isDark ? Colors.black : Colors.white;
    final Color mutedTextColor = isDark ? Colors.black : Colors.white;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appBarBg,
      elevation: 2,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTitle(context, textColor),
          // _buildUserSection(username, email, context, textColor, mutedTextColor),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context, Color textColor) {
    return Expanded(
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.titleSmall(
            context,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildUserSection(
    String username,
    String email,
    BuildContext context,
    Color textColor,
    Color mutedTextColor,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              username,
              style: AppTextStyles.bodySmall(
                context,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            Text(
              email,
              style: AppTextStyles.bodySmall(
                context,
                fontSize: 12,
                color: mutedTextColor,
              ),
            ),
          ],
        ),
        const SizedBox(width: 12),
        _buildProfileMenu(context, isDark),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildProfileMenu(BuildContext context, bool isDark) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: isDark ? Colors.grey[900] : Colors.white,
      icon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? Colors.blue[700] : Colors.blue,
        ),
        child: const Icon(Icons.person, size: 18, color: Colors.white),
      ),
      onSelected: (value) {
        if (value == 1) _logout(context);
      },
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                "Logout",
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: 'Logout Confirmation',
          message: 'Are you sure you want to log out?',
          onConfirm: () async {
            // final isLoggedOut = await loginController.logout();
            // if (isLoggedOut) {
            //   // Logout was successful, navigation handled inside controller
            // } else {
            //   debugPrint('Logout aborted due to API failure');
            // }
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}