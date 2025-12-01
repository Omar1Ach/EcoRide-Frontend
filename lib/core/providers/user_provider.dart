import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';
import '../models/user_settings.dart';
import '../constants/api_constants.dart';
import 'service_providers.dart';

// User Profile Provider - fetches user profile
final userProfileProvider = FutureProvider.autoDispose<User>((ref) async {
  final userService = ref.read(userServiceProvider);
  final storage = const FlutterSecureStorage();

  // Get userId from storage
  final userId = await storage.read(key: ApiConstants.userIdKey);

  if (userId == null) {
    throw Exception('User ID not found');
  }

  final response = await userService.getUserProfile(userId);

  return response.when(
    success: (data, _) => data,
    error: (message, _, __, ___) => throw Exception(message),
  );
});

// User Settings State Notifier
final userSettingsProvider = StateNotifierProvider<UserSettingsNotifier, AsyncValue<UserSettings>>((ref) {
  return UserSettingsNotifier(ref);
});

class UserSettingsNotifier extends StateNotifier<AsyncValue<UserSettings>> {
  final Ref ref;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  Timer? _debounceTimer;

  UserSettingsNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    state = const AsyncValue.loading();

    try {
      final userService = ref.read(userServiceProvider);
      final userId = await _storage.read(key: ApiConstants.userIdKey);

      if (userId == null) {
        state = AsyncValue.error(
          Exception('User ID not found'),
          StackTrace.current,
        );
        return;
      }

      final response = await userService.getUserSettings(userId);

      response.when(
        success: (data, _) {
          state = AsyncValue.data(data);
        },
        error: (message, _, __, ___) {
          // Fallback to default settings if API fails
          state = AsyncValue.data(
            const UserSettings(
              pushNotificationsEnabled: true,
              darkModeEnabled: false,
              hapticFeedbackEnabled: false,
              languageCode: 'en',
            ),
          );
        },
      );
    } catch (e) {
      // Fallback to default settings
      state = AsyncValue.data(
        const UserSettings(
          pushNotificationsEnabled: true,
          darkModeEnabled: false,
          hapticFeedbackEnabled: false,
          languageCode: 'en',
        ),
      );
    }
  }

  /// Update a single setting with debouncing
  Future<void> updateSetting({
    bool? pushNotificationsEnabled,
    bool? darkModeEnabled,
    bool? hapticFeedbackEnabled,
    String? languageCode,
  }) async {
    // Update local state immediately for responsive UI
    state.whenData((currentSettings) {
      state = AsyncValue.data(
        UserSettings(
          pushNotificationsEnabled: pushNotificationsEnabled ?? currentSettings.pushNotificationsEnabled,
          darkModeEnabled: darkModeEnabled ?? currentSettings.darkModeEnabled,
          hapticFeedbackEnabled: hapticFeedbackEnabled ?? currentSettings.hapticFeedbackEnabled,
          languageCode: languageCode ?? currentSettings.languageCode,
        ),
      );
    });

    // Debounce API call
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _saveSettings();
    });
  }

  /// Save settings to backend
  Future<void> _saveSettings() async {
    final currentState = state;

    if (!currentState.hasValue) return;

    final settings = currentState.value!;

    try {
      final userService = ref.read(userServiceProvider);
      final userId = await _storage.read(key: ApiConstants.userIdKey);

      if (userId == null) {
        return;
      }

      final response = await userService.updateUserSettings(userId, settings);

      response.when(
        success: (data, _) {
          state = AsyncValue.data(data);
        },
        error: (message, _, __, ___) {
          // Keep local state even if API fails (offline support)
          // Optionally show a snackbar or log the error
        },
      );
    } catch (e) {
      // Keep local state even if API fails
    }
  }

  /// Force refresh settings from backend
  Future<void> refresh() async {
    await _loadSettings();
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}

// Profile Update Notifier
final profileUpdateProvider = StateNotifierProvider<ProfileUpdateNotifier, AsyncValue<User?>>((ref) {
  return ProfileUpdateNotifier(ref);
});

class ProfileUpdateNotifier extends StateNotifier<AsyncValue<User?>> {
  final Ref ref;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  ProfileUpdateNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<bool> updateProfile(UpdateProfileRequest request) async {
    state = const AsyncValue.loading();

    try {
      final userService = ref.read(userServiceProvider);
      final userId = await _storage.read(key: ApiConstants.userIdKey);

      if (userId == null) {
        state = AsyncValue.error(
          Exception('User ID not found'),
          StackTrace.current,
        );
        return false;
      }

      final response = await userService.updateUserProfile(userId, request);

      return response.when(
        success: (data, _) {
          state = AsyncValue.data(data);

          // Invalidate user profile to refresh it
          ref.invalidate(userProfileProvider);

          return true;
        },
        error: (message, _, __, ___) {
          state = AsyncValue.error(
            Exception(message),
            StackTrace.current,
          );
          return false;
        },
      );
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      return false;
    }
  }

  String? get errorMessage {
    return state.when(
      data: (_) => null,
      loading: () => null,
      error: (error, _) => error.toString(),
    );
  }
}
