import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final VoidCallback? onOk;
  final bool showOkButton;
  final VoidCallback? onDownload;
  final TextEditingController? textController; // Controller for TextField
  final String textFieldHint;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.onConfirm,
    this.onCancel,
    this.onOk,
    this.showOkButton = false,
    this.onDownload,
    this.textController,
    this.textFieldHint = "Enter reason here",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    // responsive width
    final dialogWidth = isMobile ? size.width * 0.9 : size.width * 0.4;

    final titleFontSize = isMobile ? 18.0 : 24.0;
    final bodyFontSize = isMobile ? 14.0 : 17.0;
    final buttonWidth = isMobile ? 80.0 : 100.0;
    final buttonHeight = isMobile ? 36.0 : 40.0;
    final padding = isMobile ? 12.0 : 16.0;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 24 : 24,
      ),
      backgroundColor: const Color(0xFF242424),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: dialogWidth,
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle,
                        color: Colors.green, size: 30),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.titleMedium(
                          context,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: Colors.grey[700]),
                const SizedBox(height: 10),
                Text(
                  message,
                  style: AppTextStyles.bodyLarge(
                    context,
                    fontSize: bodyFontSize,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (textController != null) ...[
                  TextField(
                    controller: textController,
                    maxLines: isMobile ? 3 : 4,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: textFieldHint,
                      hintStyle: AppTextStyles.bodyMedium(
                        context,
                        fontSize: 14,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    if (onConfirm != null)
                      _buildButton(
                        context,
                        'Yes',
                        const Color(0xFF91C964),
                        onConfirm!,
                        buttonWidth,
                        buttonHeight,
                      ),
                    if (onCancel != null)
                      _buildButton(
                        context,
                        'No',
                        Colors.red,
                        onCancel!,
                        buttonWidth,
                        buttonHeight,
                      ),
                    if (showOkButton)
                      _buildButton(
                        context,
                        'OK',
                        const Color(0xFF91C964),
                        onOk,
                        buttonWidth,
                        buttonHeight,
                      ),
                    if (onDownload != null)
                      _buildButton(
                        context,
                        'Download',
                        const Color(0xFF91C964),
                        onDownload!,
                        buttonWidth,
                        buttonHeight,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback? onPressed,
    double width,
    double height,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.button(
            context,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
