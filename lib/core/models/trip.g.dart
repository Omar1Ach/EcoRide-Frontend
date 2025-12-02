// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      vehicleId: json['vehicleId'] as String,
      reservationId: json['reservationId'] as String,
      startLocation:
          LocationData.fromJson(json['startLocation'] as Map<String, dynamic>),
      endLocation: json['endLocation'] == null
          ? null
          : LocationData.fromJson(json['endLocation'] as Map<String, dynamic>),
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      durationInMinutes: (json['durationInMinutes'] as num?)?.toInt(),
      distanceInKilometers: (json['distanceInKilometers'] as num?)?.toDouble(),
      baseCost: (json['baseCost'] as num).toDouble(),
      perMinuteRate: (json['perMinuteRate'] as num).toDouble(),
      totalCost: (json['totalCost'] as num?)?.toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
      'reservationId': instance.reservationId,
      'startLocation': instance.startLocation,
      'endLocation': instance.endLocation,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'durationInMinutes': instance.durationInMinutes,
      'distanceInKilometers': instance.distanceInKilometers,
      'baseCost': instance.baseCost,
      'perMinuteRate': instance.perMinuteRate,
      'totalCost': instance.totalCost,
      'status': instance.status,
    };

_$StartTripResponseImpl _$$StartTripResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartTripResponseImpl(
      tripId: json['tripId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$StartTripResponseImplToJson(
        _$StartTripResponseImpl instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'startTime': instance.startTime.toIso8601String(),
      'message': instance.message,
    };

_$EndTripResponseImpl _$$EndTripResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EndTripResponseImpl(
      tripId: json['tripId'] as String,
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      totalCost: (json['totalCost'] as num).toDouble(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$EndTripResponseImplToJson(
        _$EndTripResponseImpl instance) =>
    <String, dynamic>{
      'tripId': instance.tripId,
      'durationInMinutes': instance.durationInMinutes,
      'totalCost': instance.totalCost,
      'message': instance.message,
    };

_$TripReceiptImpl _$$TripReceiptImplFromJson(Map<String, dynamic> json) =>
    _$TripReceiptImpl(
      receiptNumber: json['receiptNumber'] as String,
      tripId: json['tripId'] as String,
      userId: json['userId'] as String,
      vehicleNumber: json['vehicleNumber'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      durationInMinutes: (json['durationInMinutes'] as num).toInt(),
      distanceInKilometers: (json['distanceInKilometers'] as num).toDouble(),
      baseCost: (json['baseCost'] as num).toDouble(),
      perMinuteCost: (json['perMinuteCost'] as num).toDouble(),
      totalCost: (json['totalCost'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      issuedAt: DateTime.parse(json['issuedAt'] as String),
    );

Map<String, dynamic> _$$TripReceiptImplToJson(_$TripReceiptImpl instance) =>
    <String, dynamic>{
      'receiptNumber': instance.receiptNumber,
      'tripId': instance.tripId,
      'userId': instance.userId,
      'vehicleNumber': instance.vehicleNumber,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'durationInMinutes': instance.durationInMinutes,
      'distanceInKilometers': instance.distanceInKilometers,
      'baseCost': instance.baseCost,
      'perMinuteCost': instance.perMinuteCost,
      'totalCost': instance.totalCost,
      'paymentMethod': instance.paymentMethod,
      'issuedAt': instance.issuedAt.toIso8601String(),
    };
