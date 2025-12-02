// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      vehicleId: json['vehicleId'] as String,
      status: json['status'] as String,
      reservedAt: DateTime.parse(json['reservedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      cancelledAt: json['cancelledAt'] == null
          ? null
          : DateTime.parse(json['cancelledAt'] as String),
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
      'status': instance.status,
      'reservedAt': instance.reservedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'cancelledAt': instance.cancelledAt?.toIso8601String(),
    };

_$CreateReservationResponseImpl _$$CreateReservationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateReservationResponseImpl(
      reservationId: json['reservationId'] as String,
      vehicleId: json['vehicleId'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$CreateReservationResponseImplToJson(
        _$CreateReservationResponseImpl instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'vehicleId': instance.vehicleId,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'message': instance.message,
    };
