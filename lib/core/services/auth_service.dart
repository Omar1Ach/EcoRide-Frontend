import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/user.dart';
import '../models/api_response.dart';

class AuthService {
  final DioClient _dioClient;

  AuthService(this._dioClient);

  Future<ApiResponse<void>> register(RegisterRequest request) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.register,
        data: request.toJson(),
      );

      return const ApiResponse.success(
        data: null,
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

      return const ApiResponse.success(
        data: true, // Swagger says 200 OK, assuming success means verified
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

  Future<ApiResponse<bool>> resendOtp(String phoneNumber) async {
    try {
      await _dioClient.dio.post(
        ApiConstants.resendOtp,
        data: {'phoneNumber': phoneNumber},
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

      // Swagger says 200 OK. Assuming standard AuthResponse structure for now.
      // If backend returns different structure, this needs adjustment.
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
      // await _dioClient.dio.post(ApiConstants.logout); // Not in Swagger
      await _dioClient.clearTokens();

      return const ApiResponse.success(
        data: true,
        message: 'Logout successful',
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
