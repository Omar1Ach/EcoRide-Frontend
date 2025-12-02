import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/vehicle_service.dart';
import 'package:ecoride/core/models/vehicle.dart';
import 'package:ecoride/core/models/api_response.dart';
import 'package:ecoride/core/constants/api_constants.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late VehicleService vehicleService;
  late MockDioClient mockDioClient;
  late MockDio mockDio;

  setUp(() {
    mockDioClient = MockDioClient();
    mockDio = MockDio();
    vehicleService = VehicleService(mockDioClient);

    when(mockDioClient.dio).thenReturn(mockDio);
  });

  group('VehicleService', () {
    test('searchVehicles returns list of vehicles on success', () async {
      // Arrange
      final request = const VehicleSearchRequest(
        latitude: 33.5731,
        longitude: -7.5898,
        radiusInMeters: 5000,
      );

      final vehiclesData = [
        {
          'id': '1',
          'vehicleNumber': 'ECO-001',
          'vehicleType': 'scooter',
          'status': 'available',
          'batteryLevel': 85,
          'location': {'latitude': 33.5731, 'longitude': -7.5898},
          'qrCode': 'QR001',
          'createdAt': DateTime.now().toIso8601String(),
        },
      ];

      when(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
        data: vehiclesData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
      ));

      // Act
      final result = await vehicleService.searchVehicles(request);

      // Assert
      expect(result, isA<Success<List<Vehicle>>>());
      final successResult = result as Success<List<Vehicle>>;
      expect(successResult.data.length, 1);
      expect(successResult.data[0].id, '1');
      expect(successResult.data[0].vehicleNumber, 'ECO-001');
    });

    test('scanQrCode returns vehicle on success', () async {
      // Arrange
      final request = const ScanQrRequest(qrCode: 'QR123');

      final scanResponseData = {
        'vehicleId': '1',
        'vehicleNumber': 'ECO-001',
        'vehicleType': 'scooter',
        'batteryLevel': 85,
        'status': 'available',
      };

      when(mockDio.post(
        ApiConstants.scanQr,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        data: scanResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.scanQr),
      ));

      // Act
      final result = await vehicleService.scanQrCode(request);

      // Assert
      expect(result, isA<Success<ScanQrResponse>>());
      final successResult = result as Success<ScanQrResponse>;
      expect(successResult.data.vehicleId, '1');
      expect(successResult.data.vehicleNumber, 'ECO-001');
    });

    test('searchVehicles returns error when API call fails', () async {
      // Arrange
      final request = const VehicleSearchRequest(
        latitude: 33.5731,
        longitude: -7.5898,
        radiusInMeters: 5000,
      );

      when(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
        response: Response(
          statusCode: 500,
          requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
          data: {'message': 'Internal server error'},
        ),
        error: 'Internal server error',
      ));

      // Act
      final result = await vehicleService.searchVehicles(request);

      // Assert
      expect(result, isA<Error<List<Vehicle>>>());
    });

    test('scanQrCode returns error when QR code is invalid', () async {
      // Arrange
      final request = const ScanQrRequest(qrCode: 'INVALID-QR');

      when(mockDio.post(
        ApiConstants.scanQr,
        data: anyNamed('data'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiConstants.scanQr),
        response: Response(
          statusCode: 404,
          requestOptions: RequestOptions(path: ApiConstants.scanQr),
          data: {'message': 'Vehicle not found'},
        ),
        error: 'Vehicle not found',
      ));

      // Act
      final result = await vehicleService.scanQrCode(request);

      // Assert
      expect(result, isA<Error<ScanQrResponse>>());
    });

    test('getVehicleDetails returns vehicle on success', () async {
      // Arrange
      const vehicleId = '1';
      final vehicleData = {
        'id': '1',
        'vehicleNumber': 'ECO-001',
        'vehicleType': 'scooter',
        'status': 'available',
        'batteryLevel': 85,
        'location': {'latitude': 33.5731, 'longitude': -7.5898},
        'qrCode': 'QR001',
        'createdAt': DateTime.now().toIso8601String(),
      };

      when(mockDio.get(
        '${ApiConstants.vehicleDetails}/$vehicleId',
      )).thenAnswer((_) async => Response(
        data: vehicleData,
        statusCode: 200,
        requestOptions: RequestOptions(path: '${ApiConstants.vehicleDetails}/$vehicleId'),
      ));

      // Act
      final result = await vehicleService.getVehicleDetails(vehicleId);

      // Assert
      expect(result, isA<Success<Vehicle>>());
      final successResult = result as Success<Vehicle>;
      expect(successResult.data.id, '1');
      expect(successResult.data.vehicleNumber, 'ECO-001');
    });

    test('searchVehicles returns empty list when no vehicles found', () async {
      // Arrange
      final request = const VehicleSearchRequest(
        latitude: 33.5731,
        longitude: -7.5898,
        radiusInMeters: 5000,
      );

      when(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
        data: [],
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
      ));

      // Act
      final result = await vehicleService.searchVehicles(request);

      // Assert
      expect(result, isA<Success<List<Vehicle>>>());
      final successResult = result as Success<List<Vehicle>>;
      expect(successResult.data.length, 0);
    });
  });
}
