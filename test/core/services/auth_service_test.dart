import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/auth_service.dart';
import 'package:ecoride/core/models/user.dart';
import 'package:ecoride/core/constants/api_constants.dart';
import 'package:ecoride/core/models/api_response.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late AuthService authService;
  late MockDioClient mockDioClient;
  late MockDio mockDio;
  late MockFlutterSecureStorage mockStorage;

  setUp(() {
    mockDioClient = MockDioClient();
    mockDio = MockDio();
    mockStorage = MockFlutterSecureStorage();
    authService = AuthService(mockDioClient);

    // Setup DioClient to return mockDio
    when(mockDioClient.dio).thenReturn(mockDio);
    
    // Setup MockDio options and extra storage
    final options = BaseOptions();
    options.extra['storage'] = mockStorage;
    when(mockDio.options).thenReturn(options);
  });

  group('AuthService', () {
    test('login returns success when API call is successful', () async {
      // Arrange
      final loginRequest = const LoginRequest(email: 'test@example.com', password: 'password');
      final authResponse = AuthResponse(
        accessToken: 'access_token',
        refreshToken: 'refresh_token',
        userId: 'user_id',
        email: 'test@example.com',
        expiresAt: DateTime.now().add(const Duration(hours: 1)),
        user: User(
          id: 'user_id',
          fullName: 'Test User',
          email: 'test@example.com',
          phoneNumber: '1234567890',
          isPhoneVerified: true,
          createdAt: DateTime.now(),
        ),
      );

      when(mockDioClient.post(
        ApiConstants.login,
        data: loginRequest.toJson(),
      )).thenAnswer((_) async => ApiResponse.success(data: authResponse));

      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenAnswer((_) async {});

      // Act
      final result = await authService.login(
        email: 'test@example.com',
        password: 'password',
      );

      // Assert
      expect(result, isA<Success<AuthResponse>>());
      expect((result as Success<AuthResponse>).data, authResponse);
    });

    test('login returns error when API call fails', () async {
      // Arrange
      when(mockDioClient.post(
        ApiConstants.login,
        data: anyNamed('data'),
      )).thenAnswer((_) async => const ApiResponse.error(message: 'Invalid credentials'));

      // Act
      final result = await authService.login(
        email: 'test@example.com',
        password: 'wrong_password',
      );

      // Assert
      expect(result, isA<Error<AuthResponse>>());
      expect((result as Error<AuthResponse>).message, 'Invalid credentials');
    });
  });
}
