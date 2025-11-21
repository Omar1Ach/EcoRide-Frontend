# Backend Integration Documentation

## Overview

This document describes how the Flutter frontend is integrated with the EcoRide .NET backend API.

## Architecture

The integration follows Clean Architecture principles with the following layers:

```
┌─────────────────────────────────────────┐
│         Presentation Layer              │
│  (Screens, Widgets, UI Components)      │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Providers Layer                 │
│  (Riverpod State Management)            │
│  - auth_provider.dart                   │
│  - vehicle_provider.dart                │
│  - trip_provider.dart                   │
│  - wallet_provider.dart                 │
│  - reservation_provider.dart            │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Services Layer                  │
│  (Business Logic & API Calls)           │
│  - auth_service.dart                    │
│  - vehicle_service.dart                 │
│  - trip_service.dart                    │
│  - wallet_service.dart                  │
│  - reservation_service.dart             │
│  - user_service.dart                    │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Network Layer                   │
│  (HTTP Client with Interceptors)        │
│  - dio_client.dart                      │
└────────────────┬────────────────────────┘
                 │
┌────────────────▼────────────────────────┐
│         Backend API                     │
│  (.NET 9.0 Web API)                     │
│  http://localhost:5000                  │
└─────────────────────────────────────────┘
```

## Data Models

All models are created using Freezed for immutability and JSON serialization:

### User Models (`lib/core/models/user.dart`)

```dart
@freezed
class User {
  - id: String
  - fullName: String
  - email: String
  - phoneNumber: String
  - isPhoneVerified: bool
  - createdAt: DateTime
  - updatedAt: DateTime?
}

@freezed
class AuthResponse {
  - accessToken: String
  - refreshToken: String
  - userId: String
  - email: String
  - expiresAt: DateTime
}
```

### Vehicle Models (`lib/core/models/vehicle.dart`)

```dart
@freezed
class Vehicle {
  - id: String
  - vehicleNumber: String
  - vehicleType: String (Electric_Bike, Electric_Scooter)
  - status: String (Available, Reserved, InUse, Maintenance)
  - batteryLevel: int
  - location: LocationData
  - qrCode: String
  - lastMaintenanceDate: DateTime?
  - createdAt: DateTime?
}

@freezed
class LocationData {
  - latitude: double
  - longitude: double
}
```

### Trip Models (`lib/core/models/trip.dart`)

```dart
@freezed
class Trip {
  - id: String
  - userId: String
  - vehicleId: String
  - reservationId: String
  - startLocation: LocationData
  - endLocation: LocationData?
  - startTime: DateTime
  - endTime: DateTime?
  - durationInMinutes: int?
  - distanceInKilometers: double?
  - baseCost: double
  - perMinuteRate: double
  - totalCost: double?
  - status: String (Active, Completed, Cancelled)
}
```

### Wallet Models (`lib/core/models/wallet.dart`)

```dart
@freezed
class WalletBalance {
  - userId: String
  - balance: double
  - lastUpdated: DateTime
}

@freezed
class WalletTransaction {
  - id: String
  - userId: String
  - amount: double
  - transactionType: String (TopUp, Trip, Refund)
  - paymentMethod: String
  - paymentDetails: String?
  - description: String?
  - balanceBefore: double
  - balanceAfter: double
  - transactionDate: DateTime
}
```

### Reservation Models (`lib/core/models/reservation.dart`)

```dart
@freezed
class Reservation {
  - id: String
  - userId: String
  - vehicleId: String
  - status: String (Active, Expired, Cancelled, Completed)
  - reservedAt: DateTime
  - expiresAt: DateTime
  - cancelledAt: DateTime?
}
```

## API Services

### AuthService (`lib/core/services/auth_service.dart`)

```dart
// Register new user
Future<ApiResponse<AuthResponse>> register(RegisterRequest request)

// Verify OTP code
Future<ApiResponse<bool>> verifyOtp(VerifyOtpRequest request)

// Resend OTP
Future<ApiResponse<bool>> resendOtp(String userId)

// Login
Future<ApiResponse<AuthResponse>> login(LoginRequest request)

// Logout
Future<ApiResponse<bool>> logout()
```

### VehicleService (`lib/core/services/vehicle_service.dart`)

```dart
// Search vehicles near location
Future<ApiResponse<List<Vehicle>>> searchVehicles(
  VehicleSearchRequest request
)

// Get vehicle details
Future<ApiResponse<Vehicle>> getVehicleDetails(String vehicleId)

// Scan QR code
Future<ApiResponse<ScanQrResponse>> scanQrCode(ScanQrRequest request)
```

### ReservationService (`lib/core/services/reservation_service.dart`)

```dart
// Create reservation
Future<ApiResponse<CreateReservationResponse>> createReservation(
  CreateReservationRequest request
)

// Cancel reservation
Future<ApiResponse<bool>> cancelReservation(String reservationId)

// Get reservation details
Future<ApiResponse<Reservation>> getReservation(String reservationId)
```

### TripService (`lib/core/services/trip_service.dart`)

```dart
// Start trip
Future<ApiResponse<StartTripResponse>> startTrip(StartTripRequest request)

// End trip
Future<ApiResponse<EndTripResponse>> endTrip(
  String tripId,
  EndTripRequest request
)

// Get active trip
Future<ApiResponse<Trip?>> getActiveTrip(String userId)

// Get trip history
Future<ApiResponse<List<Trip>>> getTripHistory(
  TripHistoryRequest request
)

// Get trip details
Future<ApiResponse<Trip>> getTripDetails(String tripId)

// Get trip receipt
Future<ApiResponse<TripReceipt>> getTripReceipt(String tripId)
```

### WalletService (`lib/core/services/wallet_service.dart`)

```dart
// Get wallet balance
Future<ApiResponse<WalletBalance>> getBalance(String userId)

// Add funds to wallet
Future<ApiResponse<WalletBalance>> addFunds(AddFundsRequest request)

// Get transaction history
Future<ApiResponse<List<WalletTransaction>>> getTransactionHistory(
  TransactionHistoryRequest request
)
```

### UserService (`lib/core/services/user_service.dart`)

```dart
// Get user profile
Future<ApiResponse<User>> getProfile(String userId)

// Update user profile
Future<ApiResponse<User>> updateProfile(
  String userId,
  Map<String, dynamic> updates
)
```

## Riverpod Providers

### Authentication

```dart
// Auth State Provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>

// Current User Provider
final currentUserProvider = StateProvider<User?>

// Usage in screens:
final authState = ref.watch(authStateProvider);
final user = ref.watch(currentUserProvider);

// Actions:
await ref.read(authStateProvider.notifier).login(loginRequest);
await ref.read(authStateProvider.notifier).register(registerRequest);
await ref.read(authStateProvider.notifier).logout();
```

### Vehicles

```dart
// Nearby Vehicles Provider
final nearbyVehiclesProvider = StateNotifierProvider.family<
  NearbyVehiclesNotifier,
  AsyncValue<List<Vehicle>>,
  VehicleSearchRequest
>

// Vehicle Details Provider
final vehicleDetailsProvider = FutureProvider.family<Vehicle, String>

// QR Scanner Provider
final qrScannerProvider = StateNotifierProvider<
  QrScannerNotifier,
  AsyncValue<ScanQrResponse?>
>

// Usage:
final searchRequest = VehicleSearchRequest(
  latitude: 33.5731,
  longitude: -7.5898,
  radiusInMeters: 500,
  minBatteryLevel: 20,
);

final vehicles = ref.watch(nearbyVehiclesProvider(searchRequest));

vehicles.when(
  data: (vehicleList) => ListView.builder(...),
  loading: () => LoadingIndicator(),
  error: (error, stack) => ErrorView(message: error.toString()),
);
```

### Reservations

```dart
// Active Reservation Provider
final activeReservationProvider = StateNotifierProvider<
  ActiveReservationNotifier,
  AsyncValue<CreateReservationResponse?>
>

// Usage:
final reservation = ref.watch(activeReservationProvider);

// Create reservation
final success = await ref.read(activeReservationProvider.notifier)
  .createReservation(vehicleId);

// Cancel reservation
await ref.read(activeReservationProvider.notifier)
  .cancelReservation(reservationId);
```

### Trips

```dart
// Active Trip Provider
final activeTripProvider = StateNotifierProvider<
  ActiveTripNotifier,
  AsyncValue<Trip?>
>

// Trip History Provider
final tripHistoryProvider = FutureProvider.family<
  List<Trip>,
  TripHistoryRequest
>

// Trip Receipt Provider
final tripReceiptProvider = FutureProvider.family<TripReceipt, String>

// Usage:
// Start trip
await ref.read(activeTripProvider.notifier)
  .startTrip(reservationId);

// End trip
await ref.read(activeTripProvider.notifier)
  .endTrip(tripId, latitude, longitude);

// Get trip history
final history = ref.watch(tripHistoryProvider(
  TripHistoryRequest(userId: userId, pageNumber: 1, pageSize: 20)
));
```

### Wallet

```dart
// Wallet Balance Provider
final walletBalanceProvider = StateNotifierProvider<
  WalletBalanceNotifier,
  AsyncValue<WalletBalance>
>

// Transaction History Provider
final transactionHistoryProvider = FutureProvider.family<
  List<WalletTransaction>,
  TransactionHistoryRequest
>

// Usage:
final balance = ref.watch(walletBalanceProvider);

// Add funds
await ref.read(walletBalanceProvider.notifier)
  .addFunds(100.0, 'CreditCard');

// Get transactions
final transactions = ref.watch(transactionHistoryProvider(
  TransactionHistoryRequest(userId: userId, pageNumber: 1)
));
```

## API Endpoints Mapping

### Authentication
- `POST /api/auth/register` → AuthService.register()
- `POST /api/auth/verify-otp` → AuthService.verifyOtp()
- `POST /api/auth/resend-otp` → AuthService.resendOtp()
- `POST /api/auth/login` → AuthService.login()
- `POST /api/auth/logout` → AuthService.logout()
- `POST /api/auth/refresh-token` → DioClient._refreshToken()

### Vehicles
- `GET /api/vehicles/search` → VehicleService.searchVehicles()
- `GET /api/vehicles/{id}` → VehicleService.getVehicleDetails()
- `POST /api/vehicles/scan-qr` → VehicleService.scanQrCode()

### Reservations
- `POST /api/reservations` → ReservationService.createReservation()
- `DELETE /api/reservations/{id}` → ReservationService.cancelReservation()
- `GET /api/reservations/{id}` → ReservationService.getReservation()

### Trips
- `POST /api/trips/start` → TripService.startTrip()
- `POST /api/trips/{id}/end` → TripService.endTrip()
- `GET /api/trips/active` → TripService.getActiveTrip()
- `GET /api/trips/history` → TripService.getTripHistory()
- `GET /api/trips/{id}` → TripService.getTripDetails()
- `GET /api/trips/{id}/receipt` → TripService.getTripReceipt()

### Wallet
- `GET /api/wallet/balance` → WalletService.getBalance()
- `POST /api/wallet/add-funds` → WalletService.addFunds()
- `GET /api/wallet/transactions` → WalletService.getTransactionHistory()

### Users
- `GET /api/users/profile` → UserService.getProfile()
- `PUT /api/users/profile` → UserService.updateProfile()

## Authentication Flow

### 1. Registration Flow

```dart
// Step 1: Register user
final registerRequest = RegisterRequest(
  fullName: 'Omar Achbani',
  email: 'omar@ecoride.ma',
  phoneNumber: '+212612345678',
  password: 'SecurePass123!',
);

final success = await ref.read(authStateProvider.notifier)
  .register(registerRequest);

// Step 2: Verify OTP
if (success) {
  final verifyRequest = VerifyOtpRequest(
    userId: userId,
    otpCode: '123456',
  );

  await ref.read(authStateProvider.notifier)
    .verifyOtp(verifyRequest);
}

// Step 3: User is now authenticated
final user = ref.watch(currentUserProvider);
```

### 2. Login Flow

```dart
final loginRequest = LoginRequest(
  email: 'omar@ecoride.ma',
  password: 'SecurePass123!',
);

final success = await ref.read(authStateProvider.notifier)
  .login(loginRequest);

if (success) {
  // Navigate to home screen
  Navigator.pushReplacement(...);
}
```

### 3. Token Management

The DioClient automatically handles:
- **Token Storage**: JWT tokens stored in FlutterSecureStorage
- **Token Refresh**: Automatic refresh on 401 errors
- **Token Injection**: Authorization header added to all requests
- **Token Cleanup**: Tokens removed on logout

## Error Handling

All API responses use the `ApiResponse<T>` type:

```dart
@Freezed
class ApiResponse<T> {
  const factory ApiResponse.success({
    required T data,
    String? message,
  }) = Success<T>;

  const factory ApiResponse.error({
    required String message,
    String? code,
    int? statusCode,
    Map<String, dynamic>? details,
  }) = Error<T>;
}
```

### Handling Errors in UI

```dart
final vehicles = ref.watch(nearbyVehiclesProvider(searchRequest));

vehicles.when(
  data: (vehicleList) {
    if (vehicleList.isEmpty) {
      return EmptyState(
        icon: Icons.electric_bike,
        title: 'No vehicles found',
        subtitle: 'Try adjusting your search radius',
      );
    }
    return VehicleList(vehicles: vehicleList);
  },
  loading: () => const LoadingIndicator(),
  error: (error, stack) => ErrorView(
    message: error.toString(),
    onRetry: () => ref.refresh(nearbyVehiclesProvider(searchRequest)),
  ),
);
```

## Configuration

### API Base URL

Update `lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  // For Android Emulator
  static const String baseUrl = 'http://10.0.2.2:5000';

  // For iOS Simulator
  // static const String baseUrl = 'http://localhost:5000';

  // For Physical Device (use your computer's IP)
  // static const String baseUrl = 'http://192.168.1.XXX:5000';

  // For Production
  // static const String baseUrl = 'https://api.ecoride.ma';
}
```

## Testing

### Running Code Generation

Before running the app, generate Freezed models:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing API Integration

```bash
# 1. Start the backend API
cd EcoRideProject
dotnet run --project src/EcoRide.Api/EcoRide.Api.csproj

# 2. Run Flutter app
cd EcoRide-Frontend
flutter run
```

## Common Issues

### 1. Connection Refused

**Error**: `DioException: Connection refused`

**Solution**: Update API base URL in `api_constants.dart`
- Android Emulator: `http://10.0.2.2:5000`
- iOS Simulator: `http://localhost:5000`
- Physical Device: `http://YOUR_IP:5000`

### 2. 401 Unauthorized

**Error**: `ApiResponse.error(statusCode: 401)`

**Solution**: Token expired or invalid. Clear app data and login again:
```dart
await ref.read(authStateProvider.notifier).logout();
```

### 3. CORS Errors

**Error**: `CORS policy blocked`

**Solution**: Backend must allow mobile app origin. Check backend CORS configuration in `Program.cs`.

### 4. SSL Certificate Errors (Development)

**Error**: `HandshakeException: Certificate verify failed`

**Solution**: For development only, allow bad certificates:
```dart
// In dio_client.dart (REMOVE IN PRODUCTION!)
(_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  (HttpClient client) {
    client.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
    return client;
  };
```

## Next Steps

1. ✅ Backend integration complete
2. ⏳ Install Flutter SDK
3. ⏳ Run `flutter pub get`
4. ⏳ Run `flutter pub run build_runner build`
5. ⏳ Update API base URL
6. ⏳ Test API connection
7. ⏳ Implement UI screens with backend integration

## Complete User Flow Example

### Scenario: Tourist rents a scooter

```dart
// 1. Login
final loginSuccess = await ref.read(authStateProvider.notifier)
  .login(LoginRequest(email: email, password: password));

// 2. Search nearby vehicles
final searchRequest = VehicleSearchRequest(
  latitude: currentLat,
  longitude: currentLng,
  radiusInMeters: 500,
  minBatteryLevel: 20,
);
final vehicles = ref.watch(nearbyVehiclesProvider(searchRequest));

// 3. Reserve vehicle
final reservationSuccess = await ref.read(activeReservationProvider.notifier)
  .createReservation(selectedVehicleId);

// 4. Scan QR code
final qrSuccess = await ref.read(qrScannerProvider.notifier)
  .scanQrCode(scannedCode);

// 5. Start trip
final startSuccess = await ref.read(activeTripProvider.notifier)
  .startTrip(reservationId);

// 6. End trip
final endSuccess = await ref.read(activeTripProvider.notifier)
  .endTrip(tripId, currentLat, currentLng);

// 7. View receipt
final receipt = await ref.read(tripReceiptProvider(tripId).future);
```

---

**Developer:** Omar Achbani
**Last Updated:** November 21, 2025
