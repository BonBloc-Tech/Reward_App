
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sm_reward_app/config/textstyle.dart';

/// ----------------------------------------------
/// 3. APP THEME (LIGHT + DARK)
/// ----------------------------------------------
class AppTheme {
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Colors.orangeAccent;

  // 👉 New professional background colors
  static const Color _darkScaffoldBg = Color(0xFF1B1B1D); // main dark bg
  static const Color _darkAppBarBg   = Color(0xFF202124); // appbar dark bg

  // LIGHT THEME
  static ThemeData lightTheme(BuildContext context) {
    final base = ThemeData.light();

    final textTheme = GoogleFonts.montserratTextTheme(base.textTheme).copyWith(
      displayLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.titleLarge,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.titleLarge,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: AppTypography.titleMedium,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: AppTypography.titleSmall,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.bodyLarge,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: AppTypography.bodyMedium,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: AppTypography.bodySmall,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.label,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );

    return base.copyWith(
      brightness: Brightness.light,

      // ✅ Light BG: keep pure white as you requested
      scaffoldBackgroundColor: Colors.white,

      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        brightness: Brightness.light,
      ),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white, // unchanged
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: GoogleFonts.montserrat(
          fontSize: AppTypography.titleSmall,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        labelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: AppTypography.titleSmall,
          color: Colors.black,
        ),
        hintStyle: GoogleFonts.montserrat(
          fontSize: AppTypography.bodyMedium,
          color: Colors.black54,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: AppTypography.button,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
      ),
    );
  }

  // DARK THEME
  static ThemeData darkTheme(BuildContext context) {
    final base = ThemeData.dark();

    final textTheme = GoogleFonts.montserratTextTheme(base.textTheme).copyWith(
      titleLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.titleLarge,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: AppTypography.titleMedium,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: AppTypography.titleSmall,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.bodyLarge,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: AppTypography.bodyMedium,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: AppTypography.bodySmall,
        fontWeight: FontWeight.w400,
        color: Colors.white60,
      ),
      labelLarge: GoogleFonts.montserrat(
        fontSize: AppTypography.label,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );

    return base.copyWith(
      brightness: Brightness.dark,

      // ✅ CHANGED: dark scaffold background (not pure black)
      scaffoldBackgroundColor: _darkScaffoldBg,

      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        // ✅ CHANGED: dark app bar background
        backgroundColor: _darkAppBarBg,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.montserrat(
          fontSize: AppTypography.titleSmall,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
        labelStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          fontSize: AppTypography.titleSmall,
          color: Colors.white,
        ),
        hintStyle: GoogleFonts.montserrat(
          fontSize: AppTypography.bodyMedium,
          color: Colors.white60,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          textStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: AppTypography.button,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
      ),
    );
  }
}
