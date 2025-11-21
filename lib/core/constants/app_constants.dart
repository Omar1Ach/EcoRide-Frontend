class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'EcoRide';
  static const String appVersion = '1.0.0';

  // Map Configuration
  static const double defaultZoom = 15.0;
  static const double defaultSearchRadius = 500.0; // meters
  static const int maxSearchRadius = 5000; // meters

  // Morocco Default Location (Casablanca)
  static const double defaultLatitude = 33.5731;
  static const double defaultLongitude = -7.5898;

  // Business Rules
  static const double minWalletAmount = 10.0;
  static const double maxWalletAmount = 1000.0;
  static const double tripBaseCost = 5.0;
  static const double tripPerMinuteRate = 1.5;
  static const int minBatteryLevel = 20;

  // Reservation
  static const int reservationTimeoutMinutes = 5;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int otpLength = 6;
  static const int otpExpiryMinutes = 5;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Debounce
  static const Duration searchDebounce = Duration(milliseconds: 500);

  // Phone Format
  static const String phonePrefix = '+212';
  static const String phoneFormat = '(###) ###-####';
}
