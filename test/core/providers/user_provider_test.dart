import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ecoride/core/providers/user_provider.dart';
import 'package:ecoride/core/services/user_service.dart';
import 'package:ecoride/core/models/user.dart';
import 'package:ecoride/core/models/user_settings.dart';
import 'package:ecoride/core/models/api_response.dart';
import 'package:ecoride/core/constants/api_constants.dart';

@GenerateMocks([UserService, FlutterSecureStorage])
import 'user_provider_test.mocks.dart';

void main() {
  late MockUserService mockUserService;
  late MockFlutterSecureStorage mockStorage;
  late ProviderContainer container;

  setUp(() {
    mockUserService = MockUserService();
    mockStorage = MockFlutterSecureStorage();
  });

  tearDown(() {
    container.dispose();
  });

  group('UserProfileProvider', () {
    test('should load user profile successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      final user = User(
        id: userId,
        email: 'test@example.com',
        phoneNumber: '+212612345678',
        fullName: 'Test User',
        role: UserRole.customer,
        isActive: true,
        emailVerified: true,
        phoneVerified: true,
        registeredAt: DateTime.now(),
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.getUserProfile(userId)).thenAnswer(
        (_) async => ApiResponse.success(
          data: user,
          message: 'Profile loaded',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final profile = await container.read(userProfileProvider.future);

      // Assert
      expect(profile.id, equals(userId));
      expect(profile.email, equals('test@example.com'));
      expect(profile.fullName, equals('Test User'));
      verify(mockStorage.read(key: ApiConstants.userIdKey)).called(1);
      verify(mockUserService.getUserProfile(userId)).called(1);
    });

    test('should throw exception when user ID not found', () async {
      // Arrange
      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => null);

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act & Assert
      expect(
        () => container.read(userProfileProvider.future),
        throwsException,
      );
    });

    test('should throw exception when API returns error', () async {
      // Arrange
      const userId = 'test-user-id';

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.getUserProfile(userId)).thenAnswer(
        (_) async => const ApiResponse.error(
          message: 'Failed to load profile',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act & Assert
      expect(
        () => container.read(userProfileProvider.future),
        throwsException,
      );
    });
  });

  group('UserSettingsNotifier', () {
    test('should load default settings when API fails', () async {
      // Arrange
      const userId = 'test-user-id';

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.getUserSettings(userId)).thenAnswer(
        (_) async => const ApiResponse.error(
          message: 'Failed to load settings',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final settings = await container.read(userSettingsProvider.future);

      // Assert - Should fall back to default settings
      expect(settings.pushNotificationsEnabled, isTrue);
      expect(settings.darkModeEnabled, isFalse);
      expect(settings.hapticFeedbackEnabled, isFalse);
      expect(settings.languageCode, equals('en'));
    });

    test('should load settings successfully from API', () async {
      // Arrange
      const userId = 'test-user-id';
      const settings = UserSettings(
        pushNotificationsEnabled: false,
        darkModeEnabled: true,
        hapticFeedbackEnabled: true,
        languageCode: 'fr',
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.getUserSettings(userId)).thenAnswer(
        (_) async => const ApiResponse.success(
          data: settings,
          message: 'Settings loaded',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final loadedSettings = await container.read(userSettingsProvider.future);

      // Assert
      expect(loadedSettings.pushNotificationsEnabled, isFalse);
      expect(loadedSettings.darkModeEnabled, isTrue);
      expect(loadedSettings.hapticFeedbackEnabled, isTrue);
      expect(loadedSettings.languageCode, equals('fr'));
    });

    test('should update settings locally', () async {
      // Arrange
      const userId = 'test-user-id';
      const initialSettings = UserSettings(
        pushNotificationsEnabled: true,
        darkModeEnabled: false,
        hapticFeedbackEnabled: false,
        languageCode: 'en',
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.getUserSettings(userId)).thenAnswer(
        (_) async => const ApiResponse.success(
          data: initialSettings,
          message: 'Settings loaded',
        ),
      );

      when(mockUserService.updateUserSettings(userId, any)).thenAnswer(
        (_) async => const ApiResponse.success(
          data: UserSettings(
            pushNotificationsEnabled: true,
            darkModeEnabled: true,
            hapticFeedbackEnabled: false,
            languageCode: 'en',
          ),
          message: 'Settings updated',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Wait for initial load
      await container.read(userSettingsProvider.future);

      // Act - Update dark mode setting
      container.read(userSettingsProvider.notifier).updateSetting(
            darkModeEnabled: true,
          );

      // Wait a bit for state to update
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Check if local state updated immediately
      final currentSettings = container.read(userSettingsProvider).value;
      expect(currentSettings?.darkModeEnabled, isTrue);
    });
  });

  group('ProfileUpdateNotifier', () {
    test('should update profile successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      final updatedUser = User(
        id: userId,
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
        fullName: 'Updated Name',
        role: UserRole.customer,
        isActive: true,
        emailVerified: true,
        phoneVerified: true,
        registeredAt: DateTime.now(),
      );

      final request = UpdateProfileRequest(
        fullName: 'Updated Name',
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.updateUserProfile(userId, request)).thenAnswer(
        (_) async => ApiResponse.success(
          data: updatedUser,
          message: 'Profile updated',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final notifier = container.read(profileUpdateProvider.notifier);
      final result = await notifier.updateProfile(request);

      // Assert
      expect(result, isTrue);
      final updatedProfile = container.read(profileUpdateProvider).value;
      expect(updatedProfile?.email, equals('newemail@example.com'));
      expect(updatedProfile?.fullName, equals('Updated Name'));
    });

    test('should return false when update fails', () async {
      // Arrange
      const userId = 'test-user-id';
      final request = UpdateProfileRequest(
        fullName: 'Updated Name',
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => userId);

      when(mockUserService.updateUserProfile(userId, request)).thenAnswer(
        (_) async => const ApiResponse.error(
          message: 'Update failed',
        ),
      );

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final notifier = container.read(profileUpdateProvider.notifier);
      final result = await notifier.updateProfile(request);

      // Assert
      expect(result, isFalse);
      expect(notifier.errorMessage, contains('Update failed'));
    });

    test('should return false when user ID not found', () async {
      // Arrange
      final request = UpdateProfileRequest(
        fullName: 'Updated Name',
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
      );

      when(mockStorage.read(key: ApiConstants.userIdKey))
          .thenAnswer((_) async => null);

      container = ProviderContainer(
        overrides: [
          userServiceProvider.overrideWithValue(mockUserService),
        ],
      );

      // Act
      final notifier = container.read(profileUpdateProvider.notifier);
      final result = await notifier.updateProfile(request);

      // Assert
      expect(result, isFalse);
      expect(notifier.errorMessage, contains('User ID not found'));
    });
  });
}
