class ApiConstants {
  ApiConstants._();

  // Base URL - Change this to your backend IP
  // For Android Emulator: http://10.0.2.2:5000
  // For iOS Simulator: http://localhost:5000
  // For Physical Device: http://YOUR_IP:5000
  static const String baseUrl = 'http://localhost:5000';

  // API Version
  static const String apiVersion = 'v1';

  // Timeout
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Auth Endpoints
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  static const String resendOtp = '/api/auth/resend-otp';
  static const String refreshToken = '/api/auth/refresh-token';
  static const String logout = '/api/auth/logout';

  // User Endpoints
  static const String profile = '/api/users/profile';
  static const String updateProfile = '/api/users/profile';

  // Vehicle Endpoints
  static const String searchVehicles = '/api/vehicles/search';
  static const String vehicleDetails = '/api/vehicles';
  static const String scanQr = '/api/vehicles/scan-qr';

  // Reservation Endpoints
  static const String createReservation = '/api/reservations';
  static const String cancelReservation = '/api/reservations';
  static const String getReservation = '/api/reservations';

  // Trip Endpoints
  static const String startTrip = '/api/trips/start';
  static const String endTrip = '/api/trips/end';
  static const String activeTrip = '/api/trips/active';
  static const String tripHistory = '/api/trips/history';
  static const String tripDetails = '/api/trips';
  static const String tripReceipt = '/api/trips';

  // Wallet Endpoints
  static const String walletBalance = '/api/wallet/balance';
  static const String addFunds = '/api/wallet/add-funds';
  static const String transactions = '/api/wallet/transactions';

  // Storage Keys
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String userEmailKey = 'user_email';
}
