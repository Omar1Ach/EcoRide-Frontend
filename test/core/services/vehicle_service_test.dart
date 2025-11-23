import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:ecoride/core/services/vehicle_service.dart';
import 'package:ecoride/core/models/vehicle.dart';
import 'package:ecoride/core/constants/api_constants.dart';
import 'package:latlong2/latlong.dart';
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
    test('searchVehicles returns list of vehicles', () async {
      final request = VehicleSearchRequest(lat: 33.0, lng: -7.0, radius: 1000);
      final vehicles = [
        Vehicle(
          id: '1',
          vehicleNumber: 'V1',
          vehicleType: 'Bike',
          status: 'Available',
          batteryLevel: 90,
          location: const LocationData(latitude: 33.0, longitude: -7.0),
          qrCode: 'QR1',
        ),
      ];

      when(mockDio.get(
        ApiConstants.searchVehicles,
        queryParameters: request.toQueryParameters(),
      )).thenAnswer((_) async => Response(
        data: vehicles.map((v) => v.toJson()).toList(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.searchVehicles),
      ));

      final result = await vehicleService.searchVehicles(request);

      expect(result.isSuccess, true);
      expect(result.data?.length, 1);
      expect(result.data?.first.id, '1');
    });

    test('scanQrCode returns success', () async {
      final request = ScanQrRequest(qrCode: 'QR123', userId: 'user1');
      final response = ScanQrResponse(vehicleId: 'v1', status: 'unlocked');

      when(mockDio.post(
        ApiConstants.scanQr,
        data: request.toJson(),
      )).thenAnswer((_) async => Response(
        data: response.toJson(),
        statusCode: 200,
        requestOptions: RequestOptions(path: ApiConstants.scanQr),
      ));

      final result = await vehicleService.scanQrCode(request);

      expect(result.isSuccess, true);
      expect(result.data?.vehicleId, 'v1');
    });
  });
}
