import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/user.dart';
import '../models/api_response.dart';

class UserService {
  final DioClient _dioClient;

  UserService(this._dioClient);

  Future<ApiResponse<User>> getProfile(String userId) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.profile,
        queryParameters: {'userId': userId},
      );

      return ApiResponse.success(
        data: User.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get profile',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<User>> updateProfile(
    String userId,
    Map<String, dynamic> updates,
  ) async {
    try {
      final response = await _dioClient.dio.put(
        ApiConstants.updateProfile,
        queryParameters: {'userId': userId},
        data: updates,
      );

      return ApiResponse.success(
        data: User.fromJson(response.data),
        message: 'Profile updated successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to update profile',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
