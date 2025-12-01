import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ============================================
  // Brand Colors
  // ============================================

  /// Bright emerald green - primary brand color for both themes
  static const Color primary = Color(0xFF13EC6A);
  static const Color primaryDark = Color(0xFF0FC557);
  static const Color primaryLight = Color(0xFF4FF08D);

  // ============================================
  // Light Theme Colors
  // ============================================

  /// Very light gray-green background for light theme
  static const Color lightBackground = Color(0xFFF6F8F7);

  /// White surface color for cards and elevated components in light theme
  static const Color lightSurface = Color(0xFFFFFFFF);

  /// Subtle surface variant for light theme
  static const Color lightSurfaceVariant = Color(0xFFEEF2F0);

  /// Pure black text for primary content in light theme
  static const Color lightTextPrimary = Color(0xFF000000);

  /// Medium gray for secondary text in light theme
  static const Color lightTextSecondary = Color(0xFF666666);

  /// Light gray for hint text
  static const Color lightTextHint = Color(0xFF999999);

  /// Very light gray for disabled text
  static const Color lightTextDisabled = Color(0xFFCCCCCC);

  /// Light border color
  static const Color lightBorder = Color(0xFFE0E0E0);

  /// Light divider color
  static const Color lightDivider = Color(0xFFEEEEEE);

  // ============================================
  // Dark Theme Colors
  // ============================================

  /// Very dark green background (almost black) for dark theme
  static const Color darkBackground = Color(0xFF102217);

  /// Dark green card background for dark theme
  static const Color darkSurface = Color(0xFF193324);

  /// Slightly lighter dark green for elevated surfaces in dark theme
  static const Color darkSurfaceVariant = Color(0xFF234832);

  /// Pure white for primary text in dark theme
  static const Color darkTextPrimary = Color(0xFFFFFFFF);

  /// Muted green for secondary text in dark theme
  static const Color darkTextSecondary = Color(0xFF92C9A8);

  /// Darker muted green for hint text
  static const Color darkTextHint = Color(0xFF698776);

  /// Very dark green for disabled text
  static const Color darkTextDisabled = Color(0xFF3A4F41);

  /// Dark border color
  static const Color darkBorder = Color(0xFF2A3F33);

  /// Dark divider color
  static const Color darkDivider = Color(0xFF234832);

  // ============================================
  // Secondary Colors
  // ============================================

  static const Color secondary = Color(0xFF234832);
  static const Color secondaryDark = Color(0xFF193324);
  static const Color secondaryLight = Color(0xFF2F5A3F);

  // ============================================
  // Accent Colors
  // ============================================

  static const Color accent = Color(0xFFFFC107);
  static const Color accentLight = Color(0xFFFFE082);

  // ============================================
  // Status Colors
  // ============================================

  /// Success state - uses primary green
  static const Color success = Color(0xFF13EC6A);

  /// Warning state - amber
  static const Color warning = Color(0xFFFFC107);

  /// Error state - red
  static const Color error = Color(0xFFFF5252);

  /// Info state - blue
  static const Color info = Color(0xFF2196F3);

  // ============================================
  // Vehicle Status Colors
  // ============================================

  static const Color available = Color(0xFF13EC6A);
  static const Color reserved = Color(0xFFFFC107);
  static const Color inUse = Color(0xFF2196F3);
  static const Color maintenance = Color(0xFFFF5252);

  // ============================================
  // Battery Level Colors
  // ============================================

  static const Color batteryHigh = Color(0xFF13EC6A);
  static const Color batteryMedium = Color(0xFFFFC107);
  static const Color batteryLow = Color(0xFFFF5252);

  // ============================================
  // Overlay & Scrim
  // ============================================

  static const Color overlay = Color(0x80000000);
  static const Color scrim = Color(0x99000000);

  // ============================================
  // Legacy Compatibility
  // ============================================

  /// Legacy background - defaults to light theme
  @Deprecated('Use lightBackground or darkBackground instead')
  static const Color background = lightBackground;

  /// Legacy surface - defaults to light theme
  @Deprecated('Use lightSurface or darkSurface instead')
  static const Color surface = lightSurface;

  /// Legacy surface variant - defaults to light theme
  @Deprecated('Use lightSurfaceVariant or darkSurfaceVariant instead')
  static const Color surfaceVariant = lightSurfaceVariant;

  /// Legacy text primary - defaults to light theme
  @Deprecated('Use lightTextPrimary or darkTextPrimary instead')
  static const Color textPrimary = lightTextPrimary;

  /// Legacy text secondary - defaults to light theme
  @Deprecated('Use lightTextSecondary or darkTextSecondary instead')
  static const Color textSecondary = lightTextSecondary;

  /// Legacy text hint - defaults to light theme
  @Deprecated('Use lightTextHint or darkTextHint instead')
  static const Color textHint = lightTextHint;

  /// Legacy text disabled - defaults to light theme
  @Deprecated('Use lightTextDisabled or darkTextDisabled instead')
  static const Color textDisabled = lightTextDisabled;

  /// Legacy divider - defaults to light theme
  @Deprecated('Use lightDivider or darkDivider instead')
  static const Color divider = lightDivider;

  /// Legacy border - defaults to light theme
  @Deprecated('Use lightBorder or darkBorder instead')
  static const Color border = lightBorder;
}
