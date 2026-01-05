import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';

class GlobalAppBarMobile extends StatelessWidget {
  final String title;
  final VoidCallback? onProfileTap;

  const GlobalAppBarMobile({
    super.key,
    required this.title,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 56, // Slightly smaller for mobile
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[900] : Colors.white,
        border: const Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Row(
        children: [
          // Title
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.titleMedium(context).copyWith(
                color: isDarkMode ? Colors.white : const Color(0xFF20304A),
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis, // Handles long text
            ),
          ),

          // Profile
          InkWell(
            onTap: onProfileTap,
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.blueAccent,
                  child: const Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                // Only show name if screen is wide enough
                if (screenWidth > 320)
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 100),
                    child: Text(
                      'BHARAT KALRA & CO',
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: isDarkMode ? Colors.white : const Color(0xFF20304A),
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis, // Prevent overflow
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
