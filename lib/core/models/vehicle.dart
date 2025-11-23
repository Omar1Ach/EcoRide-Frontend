import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const Vehicle._();
  
  const factory Vehicle({
    required String id,
    required String vehicleNumber,
    required String vehicleType,
    required String status,
    required int batteryLevel,
    required LocationData location,
    required String qrCode,
    DateTime? lastMaintenanceDate,
    DateTime? createdAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
  
  bool get isAvailable => status.toLowerCase() == 'available';
  
  bool get isBike => vehicleType.toLowerCase() == 'bike';
  
  bool get isScooter => vehicleType.toLowerCase() == 'scooter';
}

@freezed
class LocationData with _$LocationData {
  const factory LocationData({
    required double latitude,
    required double longitude,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) =>
      _$LocationDataFromJson(json);
}

@freezed
class VehicleSearchRequest with _$VehicleSearchRequest {
  const VehicleSearchRequest._();

  const factory VehicleSearchRequest({
    required double latitude,
    required double longitude,
    double? radiusInMeters,
    int? minBatteryLevel,
  }) = _VehicleSearchRequest;

  Map<String, dynamic> toQueryParameters() => {
        'latitude': latitude.toString(),
        'longitude': longitude.toString(),
        if (radiusInMeters != null) 'radiusInMeters': radiusInMeters.toString(),
        if (minBatteryLevel != null)
          'minBatteryLevel': minBatteryLevel.toString(),
      };
}

@freezed
class ScanQrRequest with _$ScanQrRequest {
  const ScanQrRequest._();

  const factory ScanQrRequest({
    required String qrCode,
  }) = _ScanQrRequest;

  Map<String, dynamic> toJson() => {
        'qrCode': qrCode,
      };
}

@freezed
class ScanQrResponse with _$ScanQrResponse {
  const factory ScanQrResponse({
    required String vehicleId,
    required String vehicleNumber,
    required String vehicleType,
    required int batteryLevel,
    required String status,
  }) = _ScanQrResponse;

  factory ScanQrResponse.fromJson(Map<String, dynamic> json) =>
      _$ScanQrResponseFromJson(json);
}
