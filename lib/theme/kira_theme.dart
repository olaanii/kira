import 'package:flutter/material.dart';

class KiraColors {
  static const background = Color(0xFFF5F1EA);
  static const surface = Color(0xFFFFFFFF);
  static const softSurface = Color(0xFFECE6DB);
  static const textPrimary = Color(0xFF161616);
  static const textMuted = Color(0xFF8B867E);
  static const accent = Color(0xFFF7A36A);
  static const accentDeep = Color(0xFFF18B4E);
  static const shadow = Color(0x14000000);
  static const ringBase = Color(0xFFE0DCD3);
  static const dark = Color(0xFF1D1E22);
}

class KiraTheme {
  static ThemeData get light {
    const baseText = TextTheme(
      headlineLarge: TextStyle(
        fontSize: 39,
        fontWeight: FontWeight.w700,
        color: KiraColors.textPrimary,
        height: 1.1,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: KiraColors.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: KiraColors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: KiraColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: KiraColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: KiraColors.textMuted,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: KiraColors.textMuted,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: KiraColors.surface,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: KiraColors.textPrimary,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: KiraColors.background,
      colorScheme: const ColorScheme.light(
        primary: KiraColors.accent,
        secondary: KiraColors.accentDeep,
        surface: KiraColors.surface,
        onPrimary: KiraColors.surface,
        onSurface: KiraColors.textPrimary,
      ),
      textTheme: baseText,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      dividerColor: Colors.transparent,
    );
  }
}
