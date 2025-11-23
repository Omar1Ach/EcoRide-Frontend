import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/vehicle_service.dart';
import 'package:ecoride/core/models/vehicle.dart';
import 'package:ecoride/core/constants/api_constants.dart';
import 'package:ecoride/core/models/api_response.dart';
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

      final vehicles = [
        Vehicle(
          id: '1',
          vehicleNumber: 'ECO-001',
          vehicleType: 'scooter',
          status: 'available',
          batteryLevel: 85,
          location: const LocationData(latitude: 33.5731, longitude: -7.5898),
          qrCode: 'QR001',
          createdAt: DateTime.now(),
        ),
      ];

      when(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => Response(
        data: vehicles.map((v) => v.toJson()).toList(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
      ));

      // Act
      final result = await vehicleService.searchVehicles(request);

      // Assert
      expect(result, isA<Success<List<Vehicle>>>());
      expect((result as Success<List<Vehicle>>).data, vehicles);
      verify(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: request.toQueryParameters(),
      )).called(1);
    });

    test('scanQrCode returns vehicle on success', () async {
      // Arrange
      final request = const ScanQrRequest(qrCode: 'QR123');
      final scanResponse = const ScanQrResponse(
        vehicleId: '1',
        vehicleNumber: 'ECO-001',
        vehicleType: 'scooter',
        batteryLevel: 85,
        status: 'available',
      );

      when(mockDio.post(
        ApiConstants.scanQr,
        data: anyNamed('data'),
      )).thenAnswer((_) async => Response(
        data: scanResponse.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.scanQr),
      ));

      // Act
      final result = await vehicleService.scanQrCode(request);

      // Assert
      expect(result, isA<Success<ScanQrResponse>>());
      expect((result as Success<ScanQrResponse>).data, scanResponse);
    });
  });
}
