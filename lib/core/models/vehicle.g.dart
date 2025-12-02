// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      id: json['id'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      vehicleType: json['vehicleType'] as String,
      status: json['status'] as String,
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      location: LocationData.fromJson(json['location'] as Map<String, dynamic>),
      qrCode: json['qrCode'] as String,
      lastMaintenanceDate: json['lastMaintenanceDate'] == null
          ? null
          : DateTime.parse(json['lastMaintenanceDate'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleType': instance.vehicleType,
      'status': instance.status,
      'batteryLevel': instance.batteryLevel,
      'location': instance.location,
      'qrCode': instance.qrCode,
      'lastMaintenanceDate': instance.lastMaintenanceDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) =>
    _$LocationDataImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ScanQrResponseImpl _$$ScanQrResponseImplFromJson(Map<String, dynamic> json) =>
    _$ScanQrResponseImpl(
      vehicleId: json['vehicleId'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      vehicleType: json['vehicleType'] as String,
      batteryLevel: (json['batteryLevel'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$ScanQrResponseImplToJson(
        _$ScanQrResponseImpl instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleType': instance.vehicleType,
      'batteryLevel': instance.batteryLevel,
      'status': instance.status,
    };
