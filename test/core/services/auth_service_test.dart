import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/auth_service.dart';
import 'package:ecoride/core/models/user.dart';
import 'package:ecoride/core/models/api_response.dart';
import 'package:ecoride/core/constants/api_constants.dart';
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
      final loginRequest = const LoginRequest(
        email: 'test@example.com',
        password: 'password',
      );
      
      final authResponseData = {
        'accessToken': 'access_token',
        'refreshToken': 'refresh_token',
        'userId': 'user_id',
        'email': 'test@example.com',
        'expiresAt': DateTime.now().add(const Duration(hours: 1)).toIso8601String(),
        'user': {
          'id': 'user_id',
          'fullName': 'Test User',
          'email': 'test@example.com',
          'phoneNumber': '1234567890',
          'isPhoneVerified': true,
          'createdAt': DateTime.now().toIso8601String(),
        },
      };

      when(mockDio.post(
        ApiConstants.login,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        data: authResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.login),
      ));

      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenAnswer((_) async {});

      // Act
      final result = await authService.login(loginRequest);

      // Assert
      expect(result, isA<Success<AuthResponse>>());
      final successResult = result as Success<AuthResponse>;
      expect(successResult.data.accessToken, 'access_token');
      expect(successResult.data.user?.fullName, 'Test User');
    });

    test('login returns error when API call fails', () async {
      // Arrange
      final loginRequest = const LoginRequest(
        email: 'test@example.com',
        password: 'wrong_password',
      );

      when(mockDio.post(
        ApiConstants.login,
        data: anyNamed('data'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiConstants.login),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: ApiConstants.login),
          data: {'message': 'Invalid credentials'},
        ),
        error: 'Invalid credentials',
      ));

      // Act
      final result = await authService.login(loginRequest);

      // Assert
      expect(result, isA<Error<AuthResponse>>());
      final errorResult = result as Error<AuthResponse>;
      // DioException.error is converted to string, so check for that
      expect(errorResult.message, isNotEmpty);
    });
  });
}
