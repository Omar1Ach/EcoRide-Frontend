import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../constants/api_constants.dart';

class DioClient {
  late final Dio _dio;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      _authInterceptor(),
      _errorInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  Dio get dio => _dio;

  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _secureStorage.read(key: ApiConstants.accessTokenKey);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshed = await _refreshToken();
          if (refreshed) {
            final token = await _secureStorage.read(key: ApiConstants.accessTokenKey);
            error.requestOptions.headers['Authorization'] = 'Bearer $token';
            final response = await _dio.fetch(error.requestOptions);
            return handler.resolve(response);
          }
        }
        handler.next(error);
      },
    );
  }

  InterceptorsWrapper _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (error, handler) {
        String message = 'An error occurred';

        if (error.response != null) {
          switch (error.response!.statusCode) {
            case 400:
              message = 'Bad request';
              break;
            case 401:
              message = 'Unauthorized';
              break;
            case 403:
              message = 'Forbidden';
              break;
            case 404:
              message = 'Not found';
              break;
            case 500:
              message = 'Internal server error';
              break;
            case 503:
              message = 'Service unavailable';
              break;
            default:
              message = 'Error: ${error.response!.statusCode}';
          }

          if (error.response!.data is Map &&
              error.response!.data.containsKey('message')) {
            message = error.response!.data['message'];
          }
        } else if (error.type == DioExceptionType.connectionTimeout) {
          message = 'Connection timeout';
        } else if (error.type == DioExceptionType.receiveTimeout) {
          message = 'Receive timeout';
        } else if (error.type == DioExceptionType.connectionError) {
          message = 'No internet connection';
        }

        error.error = message;
        handler.next(error);
      },
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _secureStorage.read(key: ApiConstants.refreshTokenKey);
      if (refreshToken == null) return false;

      final response = await _dio.post(
        ApiConstants.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await _secureStorage.write(
          key: ApiConstants.accessTokenKey,
          value: newAccessToken,
        );
        await _secureStorage.write(
          key: ApiConstants.refreshTokenKey,
          value: newRefreshToken,
        );

        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: ApiConstants.accessTokenKey);
    await _secureStorage.delete(key: ApiConstants.refreshTokenKey);
  }
}
