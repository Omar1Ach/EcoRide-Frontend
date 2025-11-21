# EcoRide Frontend - Quick Start Guide

## Prerequisites

✅ Flutter SDK 3.5.0+ installed
✅ Dart SDK 3.5.0+ installed
✅ EcoRide Backend API running on `http://localhost:5000`

## Step-by-Step Setup

### 1. Install Dependencies

```bash
cd EcoRide-Frontend
flutter pub get
```

### 2. Generate Code

Run Freezed code generation for models:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- `*.freezed.dart` files (immutable models)
- `*.g.dart` files (JSON serialization)

### 3. Configure Backend URL

Edit `lib/core/constants/api_constants.dart`:

```dart
// Line 10 - Change based on your setup:

// For Android Emulator:
static const String baseUrl = 'http://10.0.2.2:5000';

// For iOS Simulator:
// static const String baseUrl = 'http://localhost:5000';

// For Physical Device (replace with your IP):
// static const String baseUrl = 'http://192.168.1.100:5000';
```

### 4. Run the App

```bash
# Check connected devices
flutter devices

# Run on connected device
flutter run

# Or run in debug mode with hot reload
flutter run --debug
```

## Backend Integration Test

### Test Authentication

```dart
// In login_screen.dart, test with these credentials:
Email: test.user@ecoride.ma
Password: TestPass123!

// Or register a new account
```

### Test Flow

1. **Register/Login** → Should return JWT token
2. **Search Vehicles** → Should show nearby vehicles from backend
3. **Reserve Vehicle** → Should create 5-minute reservation
4. **Scan QR** → Should validate vehicle QR code
5. **Start Trip** → Should begin tracking trip
6. **End Trip** → Should calculate cost and deduct from wallet
7. **View Receipt** → Should show trip details

## Project Structure

```
EcoRide-Frontend/
├── lib/
│   ├── main.dart                           # App entry point
│   ├── app.dart                            # Root widget
│   ├── core/
│   │   ├── constants/                      # App constants
│   │   ├── theme/                          # App theme
│   │   ├── network/
│   │   │   └── dio_client.dart             # HTTP client
│   │   ├── models/                         # Data models (Freezed)
│   │   │   ├── user.dart
│   │   │   ├── vehicle.dart
│   │   │   ├── trip.dart
│   │   │   ├── wallet.dart
│   │   │   └── reservation.dart
│   │   ├── services/                       # API services
│   │   │   ├── auth_service.dart
│   │   │   ├── vehicle_service.dart
│   │   │   ├── trip_service.dart
│   │   │   ├── wallet_service.dart
│   │   │   └── reservation_service.dart
│   │   └── providers/                      # Riverpod providers
│   │       ├── service_providers.dart
│   │       ├── auth_provider.dart
│   │       ├── vehicle_provider.dart
│   │       ├── trip_provider.dart
│   │       ├── wallet_provider.dart
│   │       └── reservation_provider.dart
│   ├── features/                           # Feature modules
│   │   ├── auth/
│   │   ├── map/
│   │   ├── trip/
│   │   ├── wallet/
│   │   └── profile/
│   └── shared/                             # Shared widgets
│       └── widgets/
└── BACKEND_INTEGRATION.md                  # Full documentation
```

## Testing Backend Connection

### 1. Check Backend is Running

```bash
# In backend directory
cd EcoRideProject
dotnet run --project src/EcoRide.Api/EcoRide.Api.csproj

# Should see:
# Now listening on: http://localhost:5000
# Now listening on: https://localhost:5001
```

### 2. Test API Manually

```bash
# Test health endpoint
curl http://localhost:5000/swagger

# Should open Swagger UI in browser
```

### 3. Test from Flutter

Add this test in any screen:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers/service_providers.dart';

class ApiTestScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('API Test')),
      body: Center(
        child: ElevatedButton(
          child: Text('Test Connection'),
          onPressed: () async {
            try {
              final dio = ref.read(dioClientProvider).dio;
              final response = await dio.get('/swagger/index.html');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('✅ Backend connected!'),
                  backgroundColor: Colors.green,
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('❌ Connection failed: $e'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
```

## Common Commands

```bash
# Get dependencies
flutter pub get

# Clean build
flutter clean

# Analyze code
flutter analyze

# Format code
flutter format lib/

# Run tests
flutter test

# Build APK (Android)
flutter build apk --release

# Build for iOS
flutter build ios --release

# Run with specific device
flutter run -d <device-id>

# Hot reload (press 'r' while app is running)
# Hot restart (press 'R' while app is running)
```

## Troubleshooting

### Issue: "Connection refused"

```bash
# Check backend is running
netstat -ano | findstr :5000

# Update API URL in api_constants.dart
# For Android Emulator: http://10.0.2.2:5000
# For Physical Device: http://YOUR_IP:5000
```

### Issue: "401 Unauthorized"

```dart
// Clear stored tokens
await ref.read(authStateProvider.notifier).logout();

// Login again
```

### Issue: "Freezed files not generated"

```bash
# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# If still not working, clean and regenerate
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: "DioException: Certificate verify failed"

```dart
// DEVELOPMENT ONLY - Add to dio_client.dart
import 'dart:io';

// In DioClient constructor
(_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  (HttpClient client) {
    client.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
    return client;
  };

// ⚠️ REMOVE THIS IN PRODUCTION!
```

## Development Workflow

### 1. Start Backend
```bash
cd EcoRideProject
dotnet run --project src/EcoRide.Api/EcoRide.Api.csproj
```

### 2. Start Frontend
```bash
cd EcoRide-Frontend
flutter run
```

### 3. Make Changes
- Edit files in `lib/`
- Press `r` for hot reload
- Press `R` for hot restart

### 4. Test Features
- Login/Register
- Search vehicles
- Reserve vehicle
- Scan QR code
- Start/end trip
- View wallet balance
- Add funds
- View trip history

## Next Steps

1. ✅ Backend integration complete
2. ✅ All services and providers created
3. ⏳ Install Flutter SDK
4. ⏳ Run `flutter pub get`
5. ⏳ Run code generation
6. ⏳ Update API URL
7. ⏳ Test connection
8. ⏳ Implement UI screens

## Documentation

- **BACKEND_INTEGRATION.md** - Complete backend integration documentation
- **README.md** - General project information
- **pubspec.yaml** - Dependencies and configuration

## Support

For issues or questions:
- Check BACKEND_INTEGRATION.md for detailed API documentation
- Review error messages in console
- Check backend logs for API errors
- Verify API base URL configuration

---

**Developer:** Omar Achbani
**Last Updated:** November 21, 2025
