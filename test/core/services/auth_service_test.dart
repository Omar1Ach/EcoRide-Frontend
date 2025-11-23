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
