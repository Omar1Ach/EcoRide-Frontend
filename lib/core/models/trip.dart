import 'package:freezed_annotation/freezed_annotation.dart';
import 'vehicle.dart';

part 'trip.freezed.dart';
part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String userId,
    required String vehicleId,
    required String reservationId,
    required LocationData startLocation,
    LocationData? endLocation,
    required DateTime startTime,
    DateTime? endTime,
    int? durationInMinutes,
    double? distanceInKilometers,
    required double baseCost,
    required double perMinuteRate,
    double? totalCost,
    required String status,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

@freezed
class StartTripRequest with _$StartTripRequest {
  const factory StartTripRequest({
    required String reservationId,
  }) = _StartTripRequest;

  Map<String, dynamic> toJson() => {
        'reservationId': reservationId,
      };
}

@freezed
class StartTripResponse with _$StartTripResponse {
  const factory StartTripResponse({
    required String tripId,
    required DateTime startTime,
    required String message,
  }) = _StartTripResponse;

  factory StartTripResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTripResponseFromJson(json);
}

@freezed
class EndTripRequest with _$EndTripRequest {
  const factory EndTripRequest({
    required double latitude,
    required double longitude,
  }) = _EndTripRequest;

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

@freezed
class EndTripResponse with _$EndTripResponse {
  const factory EndTripResponse({
    required String tripId,
    required int durationInMinutes,
    required double totalCost,
    required String message,
  }) = _EndTripResponse;

  factory EndTripResponse.fromJson(Map<String, dynamic> json) =>
      _$EndTripResponseFromJson(json);
}

@freezed
class TripReceipt with _$TripReceipt {
  const factory TripReceipt({
    required String receiptNumber,
    required String tripId,
    required String userId,
    required String vehicleNumber,
    required DateTime startTime,
    required DateTime endTime,
    required int durationInMinutes,
    required double distanceInKilometers,
    required double baseCost,
    required double perMinuteCost,
    required double totalCost,
    required String paymentMethod,
    required DateTime issuedAt,
  }) = _TripReceipt;

  factory TripReceipt.fromJson(Map<String, dynamic> json) =>
      _$TripReceiptFromJson(json);
}

@freezed
class TripHistoryRequest with _$TripHistoryRequest {
  const factory TripHistoryRequest({
    required String userId,
    int? pageNumber,
    int? pageSize,
  }) = _TripHistoryRequest;

  Map<String, dynamic> toQueryParameters() => {
        'userId': userId,
        if (pageNumber != null) 'pageNumber': pageNumber.toString(),
        if (pageSize != null) 'pageSize': pageSize.toString(),
      };
}
