import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/trip.dart';
import '../models/api_response.dart';

class TripService {
  final DioClient _dioClient;

  TripService(this._dioClient);

  Future<ApiResponse<StartTripResponse>> startTrip(
    StartTripRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.startTrip,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: StartTripResponse.fromJson(response.data),
        message: 'Trip started successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to start trip',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<EndTripResponse>> endTrip(
    String tripId,
    EndTripRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        '${ApiConstants.endTrip}/$tripId/end',
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: EndTripResponse.fromJson(response.data),
        message: 'Trip ended successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to end trip',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<Trip?>> getActiveTrip(String userId) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.activeTrip,
        queryParameters: {'userId': userId},
      );

      if (response.data == null) {
        return const ApiResponse.success(data: null);
      }

      return ApiResponse.success(
        data: Trip.fromJson(response.data),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const ApiResponse.success(data: null);
      }
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get active trip',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<List<Trip>>> getTripHistory(
    TripHistoryRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.tripHistory,
        queryParameters: request.toQueryParameters(),
      );

      final trips = (response.data['items'] as List)
          .map((json) => Trip.fromJson(json))
          .toList();

      return ApiResponse.success(data: trips);
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get trip history',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<Trip>> getTripDetails(String tripId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.tripDetails}/$tripId',
      );

      return ApiResponse.success(
        data: Trip.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get trip details',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<TripReceipt>> getTripReceipt(String tripId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.tripReceipt}/$tripId/receipt',
      );

      return ApiResponse.success(
        data: TripReceipt.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get trip receipt',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
