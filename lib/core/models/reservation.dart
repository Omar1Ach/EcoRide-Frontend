import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required String userId,
    required String vehicleId,
    required String status,
    required DateTime reservedAt,
    required DateTime expiresAt,
    DateTime? cancelledAt,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) =>
      _$ReservationFromJson(json);
}

@freezed
class CreateReservationRequest with _$CreateReservationRequest {
  const CreateReservationRequest._();

  const factory CreateReservationRequest({
    required String vehicleId,
  }) = _CreateReservationRequest;

  Map<String, dynamic> toJson() => {
        'vehicleId': vehicleId,
      };
}

@freezed
class CreateReservationResponse with _$CreateReservationResponse {
  const factory CreateReservationResponse({
    required String reservationId,
    required String vehicleId,
    required DateTime expiresAt,
    required String message,
  }) = _CreateReservationResponse;

  factory CreateReservationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReservationResponseFromJson(json);
}
