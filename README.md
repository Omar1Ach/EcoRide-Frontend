# EcoRide Frontend

Flutter mobile application for EcoRide - Eco-friendly Ride Sharing Platform.

**Developed by Omar Achbani**

## Project Structure

```
EcoRide-Frontend/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── constants/
│   │   │   ├── colors.dart
│   │   │   ├── api_constants.dart
│   │   │   └── app_constants.dart
│   │   ├── theme/
│   │   │   └── app_theme.dart
│   │   ├── network/
│   │   │   ├── api_client.dart
│   │   │   └── dio_client.dart
│   │   └── utils/
│   │       ├── validators.dart
│   │       └── formatters.dart
│   ├── features/
│   │   ├── auth/
│   │   ├── map/
│   │   ├── trip/
│   │   ├── wallet/
│   │   └── profile/
│   └── shared/
│       └── widgets/
├── assets/
├── test/
└── pubspec.yaml
```

## Prerequisites

- Flutter SDK 3.5.0 or higher
- Dart SDK 3.5.0 or higher
- Android Studio / VS Code with Flutter extension
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

## Installation Steps

### 1. Install Flutter

**Windows:**
```powershell
# Option 1: Using winget
winget install -e --id Flutter.Flutter

# Option 2: Manual
# Download from https://docs.flutter.dev/get-started/install/windows
# Extract to C:\src\flutter
# Add C:\src\flutter\bin to PATH
```

**Verify Installation:**
```bash
flutter doctor
```

### 2. Setup Project

```bash
cd EcoRide-Frontend

# Get dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configure Backend API

Edit `lib/core/constants/api_constants.dart`:
```dart
static const String baseUrl = 'http://YOUR_IP:5000';  // Change to your backend IP
```

### 4. Run the App

```bash
# Check connected devices
flutter devices

# Run on connected device
flutter run

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release
```

## Backend Integration

The app connects to the EcoRide Backend API:
- **Local Development:** `http://localhost:5000`
- **Android Emulator:** `http://10.0.2.2:5000`
- **iOS Simulator:** `http://localhost:5000`
- **Physical Device:** `http://YOUR_IP:5000`

## Features

- ✅ User Authentication (Register, Login, OTP)
- ✅ Map View with Vehicle Discovery
- ✅ QR Code Scanner for Vehicle Unlock
- ✅ Real-time Trip Tracking
- ✅ Wallet Management
- ✅ Trip History & Receipts
- ✅ User Profile

## Dependencies

### Core
- `flutter_riverpod` - State management
- `dio` - HTTP client
- `google_maps_flutter` - Maps integration
- `qr_code_scanner` - QR scanning

### UI
- `google_fonts` - Typography
- `flutter_svg` - SVG support
- `cached_network_image` - Image caching
- `shimmer` - Loading animations
- `lottie` - Animations

### Utils
- `geolocator` - GPS location
- `shared_preferences` - Local storage
- `flutter_secure_storage` - Secure storage
- `intl` - Internationalization

## Development Commands

```bash
# Get dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build

# Clean build
flutter clean

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format lib/

# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release
```

## Troubleshooting

### Flutter Doctor Issues

```bash
flutter doctor

# Fix Android licenses
flutter doctor --android-licenses

# Update Flutter
flutter upgrade
```

### Dependency Issues

```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### API Connection Issues

- **Android Emulator:** Use `10.0.2.2` instead of `localhost`
- **Physical Device:** Ensure phone and computer are on same network
- **CORS:** Backend must allow requests from mobile app

## Environment Setup

### Android
1. Install Android Studio
2. Install Android SDK (API 21+)
3. Create emulator or connect physical device
4. Enable USB debugging on device

### iOS (macOS only)
1. Install Xcode from App Store
2. Install CocoaPods: `sudo gem install cocoapods`
3. Run: `cd ios && pod install`

## Project Status

✅ Project structure created
✅ Dependencies configured
✅ Core utilities ready
✅ Basic screens and navigation implemented
✅ Theme and styling configured
⏳ Waiting for Flutter SDK installation
⏳ Run `flutter pub get` after SDK installation

## What's Included

The project comes with a complete foundation ready for development:

### Core Features
- **Authentication Screens:** Login and Register with form validation
- **Home Screen:** Bottom navigation with 4 main sections
- **Map Screen:** Vehicle search interface (Google Maps integration pending)
- **Trips Screen:** Trip history list
- **Wallet Screen:** Balance display and top-up interface
- **Profile Screen:** User profile and settings

### Core Infrastructure
- **Theme System:** Complete Material Design 3 theme with Inter font
- **Color Palette:** EcoRide brand colors (Primary green #00A86B)
- **API Client:** Dio HTTP client with interceptors and token refresh
- **Validators:** Form validation utilities
- **Formatters:** Currency, distance, duration formatters
- **Constants:** API endpoints and app configuration

## Next Steps

### 1. Install Flutter SDK

**Windows (Recommended):**
```powershell
# Using winget (easiest method)
winget install -e --id Flutter.Flutter

# Or download manually from:
# https://docs.flutter.dev/get-started/install/windows
```

**Verify Installation:**
```bash
flutter doctor
```

### 2. Setup Project

```bash
cd EcoRide-Frontend

# Get dependencies
flutter pub get

# Run code generation (for Riverpod, Freezed, JSON serialization)
flutter pub run build_runner build --delete-conflicting-outputs
```

### 3. Configure Backend Connection

Edit `lib/core/constants/api_constants.dart` and update the base URL:

```dart
// For Android Emulator:
static const String baseUrl = 'http://10.0.2.2:5000';

// For iOS Simulator:
static const String baseUrl = 'http://localhost:5000';

// For Physical Device (use your computer's IP):
static const String baseUrl = 'http://192.168.1.XXX:5000';
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

## Backend Integration

### Complete API Integration ✅

The frontend is fully integrated with the EcoRide .NET backend:

- **Authentication**: Login, Register, OTP verification
- **Vehicles**: Search, Details, QR scanning
- **Reservations**: Create, Cancel, View
- **Trips**: Start, End, History, Receipt
- **Wallet**: Balance, Add funds, Transactions
- **Profile**: View, Update

See **BACKEND_INTEGRATION.md** for complete API documentation.

### Quick Test

1. Start backend: `dotnet run --project ../EcoRideProject/src/EcoRide.Api/EcoRide.Api.csproj`
2. Update API URL in `lib/core/constants/api_constants.dart`
3. Run app: `flutter run`

## Documentation

- **QUICK_START.md** - Step-by-step setup guide
- **BACKEND_INTEGRATION.md** - Complete API integration documentation
- **UI_UX_Specifications.md** - Frontend design specifications

## Contact

**Developer:** Omar Achbani

For backend API documentation, see: `../EcoRideProject/README.md`
