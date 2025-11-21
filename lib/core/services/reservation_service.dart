import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/reservation.dart';
import '../models/api_response.dart';

class ReservationService {
  final DioClient _dioClient;

  ReservationService(this._dioClient);

  Future<ApiResponse<CreateReservationResponse>> createReservation(
    CreateReservationRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.createReservation,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: CreateReservationResponse.fromJson(response.data),
        message: 'Vehicle reserved successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to create reservation',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<bool>> cancelReservation(String reservationId) async {
    try {
      await _dioClient.dio.delete(
        '${ApiConstants.cancelReservation}/$reservationId',
      );

      return const ApiResponse.success(
        data: true,
        message: 'Reservation cancelled successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to cancel reservation',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<Reservation>> getReservation(String reservationId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.getReservation}/$reservationId',
      );

      return ApiResponse.success(
        data: Reservation.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get reservation',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
