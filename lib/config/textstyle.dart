

  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';

  /// ----------------------------------------------
  /// 1. GLOBAL TYPOGRAPHY CONFIG (SIZES + SCALE)
  /// ----------------------------------------------
  class AppTypography {
    /// Global scale: 1.0 = normal, 0.9 = 10% smaller, 1.1 = 10% bigger
    static const double fontScale = 0.9;

    // Title sizes
    static const double _titleLargeBase = 32;
    static const double _titleMediumBase = 24;
    static const double _titleSmallBase = 18;

    // Body sizes
    static const double _bodyLargeBase = 16;
    static const double _bodyMediumBase = 14;
    static const double _bodySmallBase = 12;

    // Label / Button
    static const double _labelBase = 16;
    static const double _buttonBase = 16;

    // Public scaled sizes
    static double get titleLarge => _titleLargeBase * fontScale;
    static double get titleMedium => _titleMediumBase * fontScale;
    static double get titleSmall => _titleSmallBase * fontScale;

    static double get bodyLarge => _bodyLargeBase * fontScale;
    static double get bodyMedium => _bodyMediumBase * fontScale;
    static double get bodySmall => _bodySmallBase * fontScale;

    static double get label => _labelBase * fontScale;
    static double get button => _buttonBase * fontScale;
  }

  /// ----------------------------------------------
  /// 2. SEMANTIC TEXT STYLES (USE IN WIDGETS)
  /// ----------------------------------------------
  class AppTextStyles {
    // Theme helpers
    static bool _isDark(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    static Color _defaultTitleColor(BuildContext context) =>
        _isDark(context) ? Colors.white : Colors.black;

    static Color _defaultBodyColor(BuildContext context) =>
        _isDark(context) ? Colors.white70 : Colors.black87;

    static Color _defaultBodyMutedColor(BuildContext context) =>
        _isDark(context) ? Colors.white60 : Colors.black54;

    static Color _defaultLabelColor(BuildContext context) =>
        _isDark(context) ? Colors.grey[300]! : Colors.black54;

    static Color _defaultButtonTextColor(BuildContext context) =>
        _isDark(context) ? Colors.black : Colors.white;

    // Titles
    static TextStyle titleLarge(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w700,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.titleLarge,
          fontWeight: fontWeight,
          color: color ?? _defaultTitleColor(context),
        );

    static TextStyle titleMedium(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w600,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.titleMedium,
          fontWeight: fontWeight,
          color: color ?? _defaultTitleColor(context),
        );

    static TextStyle titleSmall(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w500,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.titleSmall,
          fontWeight: fontWeight,
          color: color ?? _defaultTitleColor(context),
        );

    // Body
    static TextStyle bodyLarge(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w500,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.bodyLarge,
          fontWeight: fontWeight,
          color: color ?? _defaultBodyColor(context),
        );

    static TextStyle bodyMedium(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w400,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.bodyMedium,
          fontWeight: fontWeight,
          color: color ?? _defaultBodyColor(context),
        );

    static TextStyle bodySmall(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w400,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.bodySmall,
          fontWeight: fontWeight,
          color: color ?? _defaultBodyMutedColor(context),
        );

    // Label
    static TextStyle label(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w600,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.label,
          fontWeight: fontWeight,
          color: color ?? _defaultLabelColor(context),
        );

    // Button
    static TextStyle button(
      BuildContext context, {
      Color? color,
      FontWeight fontWeight = FontWeight.w600,
      double? fontSize,
    }) =>
        GoogleFonts.montserrat(
          fontSize: fontSize ?? AppTypography.button,
          fontWeight: fontWeight,
          color: color ?? _defaultButtonTextColor(context),
        );
  }