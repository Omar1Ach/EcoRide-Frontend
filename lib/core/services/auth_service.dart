import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/user.dart';
import '../models/api_response.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<ApiResponse<AuthResponse>> register(RegisterRequest request) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: AuthResponse.fromJson(response.data),
        message: 'Registration successful. Please verify your phone number.',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Registration failed',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<bool>> verifyOtp(VerifyOtpRequest request) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.verifyOtp,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: response.data['isVerified'] ?? true,
        message: 'Phone number verified successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'OTP verification failed',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<bool>> resendOtp(String userId) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.resendOtp,
        data: {'userId': userId},
      );

      return const ApiResponse.success(
        data: true,
        message: 'OTP sent successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to resend OTP',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      final authResponse = AuthResponse.fromJson(response.data);

      // Store tokens
      await _dioClient.dio.options.extra['storage'].write(
        key: ApiConstants.accessTokenKey,
        value: authResponse.accessToken,
      );
      await _dioClient.dio.options.extra['storage'].write(
        key: ApiConstants.refreshTokenKey,
        value: authResponse.refreshToken,
      );
      await _dioClient.dio.options.extra['storage'].write(
        key: ApiConstants.userIdKey,
        value: authResponse.userId,
      );
      await _dioClient.dio.options.extra['storage'].write(
        key: ApiConstants.userEmailKey,
        value: authResponse.email,
      );

      return ApiResponse.success(
        data: authResponse,
        message: 'Login successful',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Login failed',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<bool>> logout() async {
    try {
      await _dioClient.dio.post(ApiConstants.logout);
      await _dioClient.clearTokens();

      return const ApiResponse.success(
        data: true,
        message: 'Logout successful',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Logout failed',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
