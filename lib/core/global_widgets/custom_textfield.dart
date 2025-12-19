import 'package:flutter/material.dart';
import 'package:sm_reward_app/config/textstyle.dart';

/// Optional: Size variants for the textfield
enum AppTextFieldSize { small, medium, large }

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final AppTextFieldSize size;
  final int maxLines;
  final int? minLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.size = AppTextFieldSize.medium,
    this.maxLines = 1,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.focusNode,
  });

  double _verticalPadding() {
    switch (size) {
      case AppTextFieldSize.small:
        return 18.0 * AppTypography.fontScale; // compact
      case AppTextFieldSize.medium:
        return 14.0 * AppTypography.fontScale;
      case AppTextFieldSize.large:
        return 18.0 * AppTypography.fontScale;
    }
  }

  // 🔹 Rounded corners based on size
  BorderRadius _borderRadius() {
    switch (size) {
      case AppTextFieldSize.small:
        return BorderRadius.circular(10);
      case AppTextFieldSize.medium:
        return BorderRadius.circular(16);
      case AppTextFieldSize.large:
        return BorderRadius.circular(24);
    }
  }

  TextStyle _textStyle(BuildContext context) {
    // Main input text style (respects global scale)
    final base = AppTextStyles.bodyMedium(context);
    if (size == AppTextFieldSize.small) {
      return base.copyWith(fontSize: AppTypography.bodySmall);
    }
    return base;
  }

  TextStyle _labelStyle(BuildContext context) {
    return AppTextStyles.label(context);
  }

  TextStyle _hintStyle(BuildContext context) {
    return AppTextStyles.bodySmall(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decorationTheme = theme.inputDecorationTheme;

    // 🔹 Horizontal padding: smaller for small size
    final double horizontalPadding =
        size == AppTextFieldSize.small
            ? 14
            : (decorationTheme.contentPadding is EdgeInsets
                ? (decorationTheme.contentPadding as EdgeInsets).horizontal / 2
                : 23);

    final contentPadding = EdgeInsets.symmetric(
      horizontal: horizontalPadding,
      vertical: _verticalPadding(),
    );

    OutlineInputBorder buildBorder(InputBorder? themeBorder) {
      if (themeBorder is OutlineInputBorder) {
        return OutlineInputBorder(
          borderRadius: _borderRadius(),
          borderSide: themeBorder.borderSide,
        );
      }
      return OutlineInputBorder(
        borderRadius: _borderRadius(),
        borderSide: const BorderSide(color: Colors.grey),
      );
    }

    // 👉 Base border to use when NOT focused
    final OutlineInputBorder baseBorder =
        buildBorder(decorationTheme.enabledBorder ?? decorationTheme.border);

    // 🔹 Decide fill color for readonly / disabled
    final bool isDisabledStyle = readOnly || !enabled;
    final Color? readOnlyFillColor = isDisabledStyle
        ? (theme.brightness == Brightness.dark
            ? Colors.white10
            : const Color(0xFFF1F1F1))
        : decorationTheme.fillColor;

    // 🔹 Text color override for readonly state
    final Color? readonlyTextColor =
        isDisabledStyle
            ? (theme.brightness == Brightness.dark
                ? Colors.grey[300]
                : Colors.black87)
            : null;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,

      // ✅ compact + theme-aware text style
      style: _textStyle(context).copyWith(color: readonlyTextColor),

      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        isDense: size == AppTextFieldSize.small,
        labelText: label,
        hintText: hintText,
        labelStyle: _labelStyle(context),
        hintStyle: _hintStyle(context),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding,

        filled: isDisabledStyle || (decorationTheme.filled),
        fillColor: readOnlyFillColor,

        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: buildBorder(
          decorationTheme.focusedBorder ?? decorationTheme.border,
        ),
        errorBorder: buildBorder(
          decorationTheme.errorBorder ?? decorationTheme.border,
        ),
        focusedErrorBorder: buildBorder(
          decorationTheme.focusedErrorBorder ??
              decorationTheme.errorBorder,
        ),
      ),
    );
  }
}
