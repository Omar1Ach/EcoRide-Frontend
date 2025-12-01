import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/user.dart';
import '../models/user_settings.dart';
import '../models/api_response.dart';

class UserService {
  final DioClient _dioClient;

  UserService(this._dioClient);

  /// Get user profile by userId
  Future<ApiResponse<User>> getUserProfile(String userId) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.getUserProfile,
        queryParameters: {'userId': userId},
      );

      final user = User.fromJson(response.data);

      return ApiResponse.success(
        data: user,
        message: 'Profile fetched successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.response?.data['message'] ?? 'Failed to fetch profile',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  /// Update user profile
  Future<ApiResponse<User>> updateUserProfile(
    String userId,
    UpdateProfileRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.updateUserProfile,
        queryParameters: {'userId': userId},
        data: request.toJson(),
      );

      final user = User.fromJson(response.data);

      return ApiResponse.success(
        data: user,
        message: 'Profile updated successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.response?.data['message'] ?? 'Failed to update profile',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  /// Get user settings by userId
  Future<ApiResponse<UserSettings>> getUserSettings(String userId) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.getUserSettings,
        queryParameters: {'userId': userId},
      );

      final settings = UserSettings.fromJson(response.data);

      return ApiResponse.success(
        data: settings,
        message: 'Settings fetched successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.response?.data['message'] ?? 'Failed to fetch settings',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  /// Update user settings
  Future<ApiResponse<UserSettings>> updateUserSettings(
    String userId,
    UserSettings settings,
  ) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.updateUserSettings,
        queryParameters: {'userId': userId},
        data: settings.toJson(),
      );

      final updatedSettings = UserSettings.fromJson(response.data);

      return ApiResponse.success(
        data: updatedSettings,
        message: 'Settings updated successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.response?.data['message'] ?? 'Failed to update settings',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
