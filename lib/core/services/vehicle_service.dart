import 'package:dio/dio.dart';
import '../network/dio_client.dart';
import '../constants/api_constants.dart';
import '../models/vehicle.dart';
import '../models/api_response.dart';

class VehicleService {
  final DioClient _dioClient;

  VehicleService(this._dioClient);

  Future<ApiResponse<List<Vehicle>>> searchVehicles(
    VehicleSearchRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.get(
        ApiConstants.searchVehicles,
        queryParameters: request.toQueryParameters(),
      );

      final vehicles = (response.data as List)
          .map((json) => Vehicle.fromJson(json))
          .toList();

      return ApiResponse.success(
        data: vehicles,
        message: 'Found ${vehicles.length} vehicles',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to search vehicles',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<Vehicle>> getVehicleDetails(String vehicleId) async {
    try {
      final response = await _dioClient.dio.get(
        '${ApiConstants.vehicleDetails}/$vehicleId',
      );

      return ApiResponse.success(
        data: Vehicle.fromJson(response.data),
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to get vehicle details',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<ScanQrResponse>> scanQrCode(
    ScanQrRequest request,
  ) async {
    try {
      final response = await _dioClient.dio.post(
        ApiConstants.scanQr,
        data: request.toJson(),
      );

      return ApiResponse.success(
        data: ScanQrResponse.fromJson(response.data),
        message: 'QR code scanned successfully',
      );
    } on DioException catch (e) {
      return ApiResponse.error(
        message: e.error?.toString() ?? 'Failed to scan QR code',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
