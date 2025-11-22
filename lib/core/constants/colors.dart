import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF00D665); // Lime Green
  static const Color primaryDark = Color(0xFF00A850);
  static const Color primaryLight = Color(0xFF66E5A0);

  // Secondary Colors
  static const Color secondary = Color(0xFF212121); // Dark Black/Grey
  static const Color secondaryDark = Color(0xFF000000);
  static const Color secondaryLight = Color(0xFF484848);

  // Accent Colors
  static const Color accent = Color(0xFFFFC107); // Amber
  static const Color accentLight = Color(0xFFFFE082);

  // Neutral Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textDisabled = Color(0xFFE0E0E0);

  // Status Colors
  static const Color success = Color(0xFF00D665);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF2196F3);

  // Vehicle Status Colors
  static const Color available = Color(0xFF00D665);
  static const Color reserved = Color(0xFFFFC107);
  static const Color inUse = Color(0xFF2196F3);
  static const Color maintenance = Color(0xFFFF5252);

  // Battery Level Colors
  static const Color batteryHigh = Color(0xFF00D665);
  static const Color batteryMedium = Color(0xFFFFC107);
  static const Color batteryLow = Color(0xFFFF5252);

  // Divider & Border
  static const Color divider = Color(0xFFEEEEEE);
  static const Color border = Color(0xFFE0E0E0);

  // Overlay
  static const Color overlay = Color(0x80000000);
  static const Color scrim = Color(0x99000000);
}
