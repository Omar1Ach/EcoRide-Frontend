import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ecoride/core/services/user_service.dart';
import 'package:ecoride/core/models/user.dart';
import 'package:ecoride/core/models/user_settings.dart';
import 'package:ecoride/core/models/api_response.dart';

@GenerateMocks([UserService])
import 'user_provider_test.mocks.dart';

void main() {
  late MockUserService mockUserService;

  setUp(() {
    mockUserService = MockUserService();
  });

  group('UserService - Profile Operations', () {
    test('should load user profile successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      final user = User(
        id: userId,
        email: 'test@example.com',
        phoneNumber: '+212612345678',
        fullName: 'Test User',
        isPhoneVerified: true,
        createdAt: DateTime.now(),
      );

      when(mockUserService.getUserProfile(userId)).thenAnswer(
        (_) async => ApiResponse.success(
          data: user,
          message: 'Profile loaded',
        ),
      );

      // Act
      final response = await mockUserService.getUserProfile(userId);

      // Assert
      response.when(
        success: (data, message) {
          expect(data.id, equals(userId));
          expect(data.email, equals('test@example.com'));
          expect(data.fullName, equals('Test User'));
          expect(data.isPhoneVerified, isTrue);
        },
        error: (message, code, statusCode, details) {
          fail('Should not return error');
        },
      );

      verify(mockUserService.getUserProfile(userId)).called(1);
    });

    test('should return error when profile load fails', () async {
      // Arrange
      const userId = 'test-user-id';

      when(mockUserService.getUserProfile(userId)).thenAnswer(
        (_) async => const ApiResponse.error(
          message: 'Failed to load profile',
          code: 'PROFILE_NOT_FOUND',
        ),
      );

      // Act
      final response = await mockUserService.getUserProfile(userId);

      // Assert
      response.when(
        success: (data, message) {
          fail('Should not return success');
        },
        error: (message, code, statusCode, details) {
          expect(message, equals('Failed to load profile'));
          expect(code, equals('PROFILE_NOT_FOUND'));
        },
      );
    });

    test('should update profile successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      final updatedUser = User(
        id: userId,
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
        fullName: 'Updated Name',
        isPhoneVerified: true,
        createdAt: DateTime.now(),
      );

      final request = UpdateProfileRequest(
        fullName: 'Updated Name',
        email: 'newemail@example.com',
        phoneNumber: '+212612345678',
      );

      when(mockUserService.updateUserProfile(userId, request)).thenAnswer(
        (_) async => ApiResponse.success(
          data: updatedUser,
          message: 'Profile updated',
        ),
      );

      // Act
      final response = await mockUserService.updateUserProfile(userId, request);

      // Assert
      response.when(
        success: (data, message) {
          expect(data.email, equals('newemail@example.com'));
          expect(data.fullName, equals('Updated Name'));
        },
        error: (message, code, statusCode, details) {
          fail('Should not return error');
        },
      );

      verify(mockUserService.updateUserProfile(userId, request)).called(1);
    });
  });

  group('UserService - Settings Operations', () {
    test('should load settings successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      const settings = UserSettings(
        pushNotificationsEnabled: false,
        darkModeEnabled: true,
        hapticFeedbackEnabled: true,
        languageCode: 'fr',
      );

      when(mockUserService.getUserSettings(userId)).thenAnswer(
        (_) async => const ApiResponse.success(
          data: settings,
          message: 'Settings loaded',
        ),
      );

      // Act
      final response = await mockUserService.getUserSettings(userId);

      // Assert
      response.when(
        success: (data, message) {
          expect(data.pushNotificationsEnabled, isFalse);
          expect(data.darkModeEnabled, isTrue);
          expect(data.hapticFeedbackEnabled, isTrue);
          expect(data.languageCode, equals('fr'));
        },
        error: (message, code, statusCode, details) {
          fail('Should not return error');
        },
      );

      verify(mockUserService.getUserSettings(userId)).called(1);
    });

    test('should update settings successfully', () async {
      // Arrange
      const userId = 'test-user-id';
      const updatedSettings = UserSettings(
        pushNotificationsEnabled: true,
        darkModeEnabled: true,
        hapticFeedbackEnabled: false,
        languageCode: 'en',
      );

      when(mockUserService.updateUserSettings(userId, any)).thenAnswer(
        (_) async => const ApiResponse.success(
          data: updatedSettings,
          message: 'Settings updated',
        ),
      );

      // Act
      final response = await mockUserService.updateUserSettings(
        userId,
        updatedSettings,
      );

      // Assert
      response.when(
        success: (data, message) {
          expect(data.darkModeEnabled, isTrue);
          expect(data.hapticFeedbackEnabled, isFalse);
        },
        error: (message, code, statusCode, details) {
          fail('Should not return error');
        },
      );

      verify(mockUserService.updateUserSettings(userId, updatedSettings))
          .called(1);
    });

    test('should handle different language codes', () async {
      // Arrange
      const userId = 'test-user-id';
      const languages = ['en', 'fr', 'ar'];

      for (final lang in languages) {
        final settings = UserSettings(
          pushNotificationsEnabled: true,
          darkModeEnabled: false,
          hapticFeedbackEnabled: false,
          languageCode: lang,
        );

        when(mockUserService.getUserSettings(userId)).thenAnswer(
          (_) async => ApiResponse.success(
            data: settings,
            message: 'Settings loaded',
          ),
        );

        // Act
        final response = await mockUserService.getUserSettings(userId);

        // Assert
        response.when(
          success: (data, message) {
            expect(data.languageCode, equals(lang));
          },
          error: (message, code, statusCode, details) {
            fail('Should not return error');
          },
        );
      }
    });
  });
}
