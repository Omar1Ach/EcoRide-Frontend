import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/auth_service.dart';
import 'package:ecoride/core/models/user.dart';
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
      final loginRequest = LoginRequest(email: 'test@example.com', password: 'password');
      final authResponse = AuthResponse(
        accessToken: 'access_token',
        refreshToken: 'refresh_token',
        userId: 'user_id',
        email: 'test@example.com',
        fullName: 'Test User',
      );

      when(mockDio.post(
        ApiConstants.login,
        data: loginRequest.toJson(),
      )).thenAnswer((_) async => Response(
        data: authResponse.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.login),
      ));

      when(mockStorage.write(key: anyNamed('key'), value: anyNamed('value')))
          .thenAnswer((_) async {});

      // Act
      final result = await authService.login(loginRequest);

      // Assert
      expect(result.isSuccess, true);
      expect(result.data, isA<AuthResponse>());
      expect(result.data?.email, 'test@example.com');
      verify(mockStorage.write(key: ApiConstants.accessTokenKey, value: 'access_token')).called(1);
    });

    test('login returns error when API call fails', () async {
      // Arrange
      final loginRequest = LoginRequest(email: 'test@example.com', password: 'wrong_password');

      when(mockDio.post(
        ApiConstants.login,
        data: loginRequest.toJson(),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiConstants.login),
        response: Response(
          statusCode: 401,
          requestOptions: RequestOptions(path: ApiConstants.login),
          data: {'message': 'Invalid credentials'},
        ),
      ));

      // Act
      final result = await authService.login(loginRequest);

      // Assert
      expect(result.isSuccess, false);
      expect(result.message, 'Invalid credentials');
    });
  });
}
