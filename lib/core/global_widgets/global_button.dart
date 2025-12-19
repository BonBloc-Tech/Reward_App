import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';

/// Optional: Size variants for the button
enum AppButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonSize size;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.size = AppButtonSize.medium,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
  });

  double _height() {
    switch (size) {
      case AppButtonSize.small:
        return 40.0 * AppTypography.fontScale;
      case AppButtonSize.medium:
        return 46.0 * AppTypography.fontScale;
      case AppButtonSize.large:
        return 52.0 * AppTypography.fontScale;
    }
  }

  double _horizontalPadding() {
    switch (size) {
      case AppButtonSize.small:
        return 24.0;
      case AppButtonSize.medium:
        return 32.0;
      case AppButtonSize.large:
        return 40.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // 🔹 BACKGROUND COLOR LOGIC
    // Use user override if provided, else pick based on theme
    final Color bgColor = backgroundColor ??
        (isDark ? Colors.orangeAccent : Colors.blueAccent);

    // 🔹 TEXT STYLE ALREADY DARK/LIGHT AWARE
    final textStyle = AppTextStyles.button(context);

    // 🔹 TEXT COLOR
    final textColor = foregroundColor ?? textStyle.color ?? Colors.white;

    final effectiveHeight = height ?? _height();
    final effectiveRadius = borderRadius ?? BorderRadius.circular(30);

    return SizedBox(
      width: width,
      height: effectiveHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: effectiveRadius,
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 12,
                horizontal: _horizontalPadding(),
              ),
          elevation: 5,
          textStyle: textStyle,
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(textColor),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null) ...[
                    prefixIcon!,
                    const SizedBox(width: 8),
                  ],
                  Text(label, style: textStyle.copyWith(color: textColor)),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: 8),
                    suffixIcon!,
                  ],
                ],
              ),
      ),
    );
  }
}
