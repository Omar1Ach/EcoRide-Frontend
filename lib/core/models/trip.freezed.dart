// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get reservationId => throw _privateConstructorUsedError;
  LocationData get startLocation => throw _privateConstructorUsedError;
  LocationData? get endLocation => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int? get durationInMinutes => throw _privateConstructorUsedError;
  double? get distanceInKilometers => throw _privateConstructorUsedError;
  double get baseCost => throw _privateConstructorUsedError;
  double get perMinuteRate => throw _privateConstructorUsedError;
  double? get totalCost => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Trip to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String vehicleId,
      String reservationId,
      LocationData startLocation,
      LocationData? endLocation,
      DateTime startTime,
      DateTime? endTime,
      int? durationInMinutes,
      double? distanceInKilometers,
      double baseCost,
      double perMinuteRate,
      double? totalCost,
      String status});

  $LocationDataCopyWith<$Res> get startLocation;
  $LocationDataCopyWith<$Res>? get endLocation;
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleId = null,
    Object? reservationId = null,
    Object? startLocation = null,
    Object? endLocation = freezed,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationInMinutes = freezed,
    Object? distanceInKilometers = freezed,
    Object? baseCost = null,
    Object? perMinuteRate = null,
    Object? totalCost = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      startLocation: null == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as LocationData,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInMinutes: freezed == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      distanceInKilometers: freezed == distanceInKilometers
          ? _value.distanceInKilometers
          : distanceInKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as double,
      perMinuteRate: null == perMinuteRate
          ? _value.perMinuteRate
          : perMinuteRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<$Res> get startLocation {
    return $LocationDataCopyWith<$Res>(_value.startLocation, (value) {
      return _then(_value.copyWith(startLocation: value) as $Val);
    });
  }

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<$Res>? get endLocation {
    if (_value.endLocation == null) {
      return null;
    }

    return $LocationDataCopyWith<$Res>(_value.endLocation!, (value) {
      return _then(_value.copyWith(endLocation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String vehicleId,
      String reservationId,
      LocationData startLocation,
      LocationData? endLocation,
      DateTime startTime,
      DateTime? endTime,
      int? durationInMinutes,
      double? distanceInKilometers,
      double baseCost,
      double perMinuteRate,
      double? totalCost,
      String status});

  @override
  $LocationDataCopyWith<$Res> get startLocation;
  @override
  $LocationDataCopyWith<$Res>? get endLocation;
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleId = null,
    Object? reservationId = null,
    Object? startLocation = null,
    Object? endLocation = freezed,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? durationInMinutes = freezed,
    Object? distanceInKilometers = freezed,
    Object? baseCost = null,
    Object? perMinuteRate = null,
    Object? totalCost = freezed,
    Object? status = null,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      startLocation: null == startLocation
          ? _value.startLocation
          : startLocation // ignore: cast_nullable_to_non_nullable
              as LocationData,
      endLocation: freezed == endLocation
          ? _value.endLocation
          : endLocation // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      durationInMinutes: freezed == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      distanceInKilometers: freezed == distanceInKilometers
          ? _value.distanceInKilometers
          : distanceInKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as double,
      perMinuteRate: null == perMinuteRate
          ? _value.perMinuteRate
          : perMinuteRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: freezed == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl implements _Trip {
  const _$TripImpl(
      {required this.id,
      required this.userId,
      required this.vehicleId,
      required this.reservationId,
      required this.startLocation,
      this.endLocation,
      required this.startTime,
      this.endTime,
      this.durationInMinutes,
      this.distanceInKilometers,
      required this.baseCost,
      required this.perMinuteRate,
      this.totalCost,
      required this.status});

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String vehicleId;
  @override
  final String reservationId;
  @override
  final LocationData startLocation;
  @override
  final LocationData? endLocation;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final int? durationInMinutes;
  @override
  final double? distanceInKilometers;
  @override
  final double baseCost;
  @override
  final double perMinuteRate;
  @override
  final double? totalCost;
  @override
  final String status;

  @override
  String toString() {
    return 'Trip(id: $id, userId: $userId, vehicleId: $vehicleId, reservationId: $reservationId, startLocation: $startLocation, endLocation: $endLocation, startTime: $startTime, endTime: $endTime, durationInMinutes: $durationInMinutes, distanceInKilometers: $distanceInKilometers, baseCost: $baseCost, perMinuteRate: $perMinuteRate, totalCost: $totalCost, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.startLocation, startLocation) ||
                other.startLocation == startLocation) &&
            (identical(other.endLocation, endLocation) ||
                other.endLocation == endLocation) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.distanceInKilometers, distanceInKilometers) ||
                other.distanceInKilometers == distanceInKilometers) &&
            (identical(other.baseCost, baseCost) ||
                other.baseCost == baseCost) &&
            (identical(other.perMinuteRate, perMinuteRate) ||
                other.perMinuteRate == perMinuteRate) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      vehicleId,
      reservationId,
      startLocation,
      endLocation,
      startTime,
      endTime,
      durationInMinutes,
      distanceInKilometers,
      baseCost,
      perMinuteRate,
      totalCost,
      status);

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {required final String id,
      required final String userId,
      required final String vehicleId,
      required final String reservationId,
      required final LocationData startLocation,
      final LocationData? endLocation,
      required final DateTime startTime,
      final DateTime? endTime,
      final int? durationInMinutes,
      final double? distanceInKilometers,
      required final double baseCost,
      required final double perMinuteRate,
      final double? totalCost,
      required final String status}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get vehicleId;
  @override
  String get reservationId;
  @override
  LocationData get startLocation;
  @override
  LocationData? get endLocation;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  int? get durationInMinutes;
  @override
  double? get distanceInKilometers;
  @override
  double get baseCost;
  @override
  double get perMinuteRate;
  @override
  double? get totalCost;
  @override
  String get status;

  /// Create a copy of Trip
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StartTripRequest {
  String get reservationId => throw _privateConstructorUsedError;

  /// Create a copy of StartTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartTripRequestCopyWith<StartTripRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartTripRequestCopyWith<$Res> {
  factory $StartTripRequestCopyWith(
          StartTripRequest value, $Res Function(StartTripRequest) then) =
      _$StartTripRequestCopyWithImpl<$Res, StartTripRequest>;
  @useResult
  $Res call({String reservationId});
}

/// @nodoc
class _$StartTripRequestCopyWithImpl<$Res, $Val extends StartTripRequest>
    implements $StartTripRequestCopyWith<$Res> {
  _$StartTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
  }) {
    return _then(_value.copyWith(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartTripRequestImplCopyWith<$Res>
    implements $StartTripRequestCopyWith<$Res> {
  factory _$$StartTripRequestImplCopyWith(_$StartTripRequestImpl value,
          $Res Function(_$StartTripRequestImpl) then) =
      __$$StartTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reservationId});
}

/// @nodoc
class __$$StartTripRequestImplCopyWithImpl<$Res>
    extends _$StartTripRequestCopyWithImpl<$Res, _$StartTripRequestImpl>
    implements _$$StartTripRequestImplCopyWith<$Res> {
  __$$StartTripRequestImplCopyWithImpl(_$StartTripRequestImpl _value,
      $Res Function(_$StartTripRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
  }) {
    return _then(_$StartTripRequestImpl(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartTripRequestImpl extends _StartTripRequest {
  const _$StartTripRequestImpl({required this.reservationId}) : super._();

  @override
  final String reservationId;

  @override
  String toString() {
    return 'StartTripRequest(reservationId: $reservationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTripRequestImpl &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reservationId);

  /// Create a copy of StartTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTripRequestImplCopyWith<_$StartTripRequestImpl> get copyWith =>
      __$$StartTripRequestImplCopyWithImpl<_$StartTripRequestImpl>(
          this, _$identity);
}

abstract class _StartTripRequest extends StartTripRequest {
  const factory _StartTripRequest({required final String reservationId}) =
      _$StartTripRequestImpl;
  const _StartTripRequest._() : super._();

  @override
  String get reservationId;

  /// Create a copy of StartTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartTripRequestImplCopyWith<_$StartTripRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StartTripResponse _$StartTripResponseFromJson(Map<String, dynamic> json) {
  return _StartTripResponse.fromJson(json);
}

/// @nodoc
mixin _$StartTripResponse {
  String get tripId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this StartTripResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartTripResponseCopyWith<StartTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartTripResponseCopyWith<$Res> {
  factory $StartTripResponseCopyWith(
          StartTripResponse value, $Res Function(StartTripResponse) then) =
      _$StartTripResponseCopyWithImpl<$Res, StartTripResponse>;
  @useResult
  $Res call({String tripId, DateTime startTime, String message});
}

/// @nodoc
class _$StartTripResponseCopyWithImpl<$Res, $Val extends StartTripResponse>
    implements $StartTripResponseCopyWith<$Res> {
  _$StartTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? startTime = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartTripResponseImplCopyWith<$Res>
    implements $StartTripResponseCopyWith<$Res> {
  factory _$$StartTripResponseImplCopyWith(_$StartTripResponseImpl value,
          $Res Function(_$StartTripResponseImpl) then) =
      __$$StartTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tripId, DateTime startTime, String message});
}

/// @nodoc
class __$$StartTripResponseImplCopyWithImpl<$Res>
    extends _$StartTripResponseCopyWithImpl<$Res, _$StartTripResponseImpl>
    implements _$$StartTripResponseImplCopyWith<$Res> {
  __$$StartTripResponseImplCopyWithImpl(_$StartTripResponseImpl _value,
      $Res Function(_$StartTripResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StartTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? startTime = null,
    Object? message = null,
  }) {
    return _then(_$StartTripResponseImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartTripResponseImpl implements _StartTripResponse {
  const _$StartTripResponseImpl(
      {required this.tripId, required this.startTime, required this.message});

  factory _$StartTripResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartTripResponseImplFromJson(json);

  @override
  final String tripId;
  @override
  final DateTime startTime;
  @override
  final String message;

  @override
  String toString() {
    return 'StartTripResponse(tripId: $tripId, startTime: $startTime, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTripResponseImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tripId, startTime, message);

  /// Create a copy of StartTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTripResponseImplCopyWith<_$StartTripResponseImpl> get copyWith =>
      __$$StartTripResponseImplCopyWithImpl<_$StartTripResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartTripResponseImplToJson(
      this,
    );
  }
}

abstract class _StartTripResponse implements StartTripResponse {
  const factory _StartTripResponse(
      {required final String tripId,
      required final DateTime startTime,
      required final String message}) = _$StartTripResponseImpl;

  factory _StartTripResponse.fromJson(Map<String, dynamic> json) =
      _$StartTripResponseImpl.fromJson;

  @override
  String get tripId;
  @override
  DateTime get startTime;
  @override
  String get message;

  /// Create a copy of StartTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartTripResponseImplCopyWith<_$StartTripResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EndTripRequest {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Create a copy of EndTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EndTripRequestCopyWith<EndTripRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndTripRequestCopyWith<$Res> {
  factory $EndTripRequestCopyWith(
          EndTripRequest value, $Res Function(EndTripRequest) then) =
      _$EndTripRequestCopyWithImpl<$Res, EndTripRequest>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$EndTripRequestCopyWithImpl<$Res, $Val extends EndTripRequest>
    implements $EndTripRequestCopyWith<$Res> {
  _$EndTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EndTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndTripRequestImplCopyWith<$Res>
    implements $EndTripRequestCopyWith<$Res> {
  factory _$$EndTripRequestImplCopyWith(_$EndTripRequestImpl value,
          $Res Function(_$EndTripRequestImpl) then) =
      __$$EndTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$EndTripRequestImplCopyWithImpl<$Res>
    extends _$EndTripRequestCopyWithImpl<$Res, _$EndTripRequestImpl>
    implements _$$EndTripRequestImplCopyWith<$Res> {
  __$$EndTripRequestImplCopyWithImpl(
      _$EndTripRequestImpl _value, $Res Function(_$EndTripRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of EndTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$EndTripRequestImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$EndTripRequestImpl extends _EndTripRequest {
  const _$EndTripRequestImpl({required this.latitude, required this.longitude})
      : super._();

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'EndTripRequest(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndTripRequestImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of EndTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndTripRequestImplCopyWith<_$EndTripRequestImpl> get copyWith =>
      __$$EndTripRequestImplCopyWithImpl<_$EndTripRequestImpl>(
          this, _$identity);
}

abstract class _EndTripRequest extends EndTripRequest {
  const factory _EndTripRequest(
      {required final double latitude,
      required final double longitude}) = _$EndTripRequestImpl;
  const _EndTripRequest._() : super._();

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of EndTripRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndTripRequestImplCopyWith<_$EndTripRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EndTripResponse _$EndTripResponseFromJson(Map<String, dynamic> json) {
  return _EndTripResponse.fromJson(json);
}

/// @nodoc
mixin _$EndTripResponse {
  String get tripId => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this EndTripResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EndTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EndTripResponseCopyWith<EndTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndTripResponseCopyWith<$Res> {
  factory $EndTripResponseCopyWith(
          EndTripResponse value, $Res Function(EndTripResponse) then) =
      _$EndTripResponseCopyWithImpl<$Res, EndTripResponse>;
  @useResult
  $Res call(
      {String tripId, int durationInMinutes, double totalCost, String message});
}

/// @nodoc
class _$EndTripResponseCopyWithImpl<$Res, $Val extends EndTripResponse>
    implements $EndTripResponseCopyWith<$Res> {
  _$EndTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EndTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? durationInMinutes = null,
    Object? totalCost = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndTripResponseImplCopyWith<$Res>
    implements $EndTripResponseCopyWith<$Res> {
  factory _$$EndTripResponseImplCopyWith(_$EndTripResponseImpl value,
          $Res Function(_$EndTripResponseImpl) then) =
      __$$EndTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tripId, int durationInMinutes, double totalCost, String message});
}

/// @nodoc
class __$$EndTripResponseImplCopyWithImpl<$Res>
    extends _$EndTripResponseCopyWithImpl<$Res, _$EndTripResponseImpl>
    implements _$$EndTripResponseImplCopyWith<$Res> {
  __$$EndTripResponseImplCopyWithImpl(
      _$EndTripResponseImpl _value, $Res Function(_$EndTripResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EndTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? durationInMinutes = null,
    Object? totalCost = null,
    Object? message = null,
  }) {
    return _then(_$EndTripResponseImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EndTripResponseImpl implements _EndTripResponse {
  const _$EndTripResponseImpl(
      {required this.tripId,
      required this.durationInMinutes,
      required this.totalCost,
      required this.message});

  factory _$EndTripResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndTripResponseImplFromJson(json);

  @override
  final String tripId;
  @override
  final int durationInMinutes;
  @override
  final double totalCost;
  @override
  final String message;

  @override
  String toString() {
    return 'EndTripResponse(tripId: $tripId, durationInMinutes: $durationInMinutes, totalCost: $totalCost, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndTripResponseImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tripId, durationInMinutes, totalCost, message);

  /// Create a copy of EndTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndTripResponseImplCopyWith<_$EndTripResponseImpl> get copyWith =>
      __$$EndTripResponseImplCopyWithImpl<_$EndTripResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EndTripResponseImplToJson(
      this,
    );
  }
}

abstract class _EndTripResponse implements EndTripResponse {
  const factory _EndTripResponse(
      {required final String tripId,
      required final int durationInMinutes,
      required final double totalCost,
      required final String message}) = _$EndTripResponseImpl;

  factory _EndTripResponse.fromJson(Map<String, dynamic> json) =
      _$EndTripResponseImpl.fromJson;

  @override
  String get tripId;
  @override
  int get durationInMinutes;
  @override
  double get totalCost;
  @override
  String get message;

  /// Create a copy of EndTripResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndTripResponseImplCopyWith<_$EndTripResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TripReceipt _$TripReceiptFromJson(Map<String, dynamic> json) {
  return _TripReceipt.fromJson(json);
}

/// @nodoc
mixin _$TripReceipt {
  String get receiptNumber => throw _privateConstructorUsedError;
  String get tripId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  int get durationInMinutes => throw _privateConstructorUsedError;
  double get distanceInKilometers => throw _privateConstructorUsedError;
  double get baseCost => throw _privateConstructorUsedError;
  double get perMinuteCost => throw _privateConstructorUsedError;
  double get totalCost => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  DateTime get issuedAt => throw _privateConstructorUsedError;

  /// Serializes this TripReceipt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TripReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripReceiptCopyWith<TripReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripReceiptCopyWith<$Res> {
  factory $TripReceiptCopyWith(
          TripReceipt value, $Res Function(TripReceipt) then) =
      _$TripReceiptCopyWithImpl<$Res, TripReceipt>;
  @useResult
  $Res call(
      {String receiptNumber,
      String tripId,
      String userId,
      String vehicleNumber,
      DateTime startTime,
      DateTime endTime,
      int durationInMinutes,
      double distanceInKilometers,
      double baseCost,
      double perMinuteCost,
      double totalCost,
      String paymentMethod,
      DateTime issuedAt});
}

/// @nodoc
class _$TripReceiptCopyWithImpl<$Res, $Val extends TripReceipt>
    implements $TripReceiptCopyWith<$Res> {
  _$TripReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptNumber = null,
    Object? tripId = null,
    Object? userId = null,
    Object? vehicleNumber = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationInMinutes = null,
    Object? distanceInKilometers = null,
    Object? baseCost = null,
    Object? perMinuteCost = null,
    Object? totalCost = null,
    Object? paymentMethod = null,
    Object? issuedAt = null,
  }) {
    return _then(_value.copyWith(
      receiptNumber: null == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      distanceInKilometers: null == distanceInKilometers
          ? _value.distanceInKilometers
          : distanceInKilometers // ignore: cast_nullable_to_non_nullable
              as double,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as double,
      perMinuteCost: null == perMinuteCost
          ? _value.perMinuteCost
          : perMinuteCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripReceiptImplCopyWith<$Res>
    implements $TripReceiptCopyWith<$Res> {
  factory _$$TripReceiptImplCopyWith(
          _$TripReceiptImpl value, $Res Function(_$TripReceiptImpl) then) =
      __$$TripReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String receiptNumber,
      String tripId,
      String userId,
      String vehicleNumber,
      DateTime startTime,
      DateTime endTime,
      int durationInMinutes,
      double distanceInKilometers,
      double baseCost,
      double perMinuteCost,
      double totalCost,
      String paymentMethod,
      DateTime issuedAt});
}

/// @nodoc
class __$$TripReceiptImplCopyWithImpl<$Res>
    extends _$TripReceiptCopyWithImpl<$Res, _$TripReceiptImpl>
    implements _$$TripReceiptImplCopyWith<$Res> {
  __$$TripReceiptImplCopyWithImpl(
      _$TripReceiptImpl _value, $Res Function(_$TripReceiptImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiptNumber = null,
    Object? tripId = null,
    Object? userId = null,
    Object? vehicleNumber = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? durationInMinutes = null,
    Object? distanceInKilometers = null,
    Object? baseCost = null,
    Object? perMinuteCost = null,
    Object? totalCost = null,
    Object? paymentMethod = null,
    Object? issuedAt = null,
  }) {
    return _then(_$TripReceiptImpl(
      receiptNumber: null == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInMinutes: null == durationInMinutes
          ? _value.durationInMinutes
          : durationInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      distanceInKilometers: null == distanceInKilometers
          ? _value.distanceInKilometers
          : distanceInKilometers // ignore: cast_nullable_to_non_nullable
              as double,
      baseCost: null == baseCost
          ? _value.baseCost
          : baseCost // ignore: cast_nullable_to_non_nullable
              as double,
      perMinuteCost: null == perMinuteCost
          ? _value.perMinuteCost
          : perMinuteCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      issuedAt: null == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripReceiptImpl implements _TripReceipt {
  const _$TripReceiptImpl(
      {required this.receiptNumber,
      required this.tripId,
      required this.userId,
      required this.vehicleNumber,
      required this.startTime,
      required this.endTime,
      required this.durationInMinutes,
      required this.distanceInKilometers,
      required this.baseCost,
      required this.perMinuteCost,
      required this.totalCost,
      required this.paymentMethod,
      required this.issuedAt});

  factory _$TripReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripReceiptImplFromJson(json);

  @override
  final String receiptNumber;
  @override
  final String tripId;
  @override
  final String userId;
  @override
  final String vehicleNumber;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final int durationInMinutes;
  @override
  final double distanceInKilometers;
  @override
  final double baseCost;
  @override
  final double perMinuteCost;
  @override
  final double totalCost;
  @override
  final String paymentMethod;
  @override
  final DateTime issuedAt;

  @override
  String toString() {
    return 'TripReceipt(receiptNumber: $receiptNumber, tripId: $tripId, userId: $userId, vehicleNumber: $vehicleNumber, startTime: $startTime, endTime: $endTime, durationInMinutes: $durationInMinutes, distanceInKilometers: $distanceInKilometers, baseCost: $baseCost, perMinuteCost: $perMinuteCost, totalCost: $totalCost, paymentMethod: $paymentMethod, issuedAt: $issuedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripReceiptImpl &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.durationInMinutes, durationInMinutes) ||
                other.durationInMinutes == durationInMinutes) &&
            (identical(other.distanceInKilometers, distanceInKilometers) ||
                other.distanceInKilometers == distanceInKilometers) &&
            (identical(other.baseCost, baseCost) ||
                other.baseCost == baseCost) &&
            (identical(other.perMinuteCost, perMinuteCost) ||
                other.perMinuteCost == perMinuteCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      receiptNumber,
      tripId,
      userId,
      vehicleNumber,
      startTime,
      endTime,
      durationInMinutes,
      distanceInKilometers,
      baseCost,
      perMinuteCost,
      totalCost,
      paymentMethod,
      issuedAt);

  /// Create a copy of TripReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripReceiptImplCopyWith<_$TripReceiptImpl> get copyWith =>
      __$$TripReceiptImplCopyWithImpl<_$TripReceiptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripReceiptImplToJson(
      this,
    );
  }
}

abstract class _TripReceipt implements TripReceipt {
  const factory _TripReceipt(
      {required final String receiptNumber,
      required final String tripId,
      required final String userId,
      required final String vehicleNumber,
      required final DateTime startTime,
      required final DateTime endTime,
      required final int durationInMinutes,
      required final double distanceInKilometers,
      required final double baseCost,
      required final double perMinuteCost,
      required final double totalCost,
      required final String paymentMethod,
      required final DateTime issuedAt}) = _$TripReceiptImpl;

  factory _TripReceipt.fromJson(Map<String, dynamic> json) =
      _$TripReceiptImpl.fromJson;

  @override
  String get receiptNumber;
  @override
  String get tripId;
  @override
  String get userId;
  @override
  String get vehicleNumber;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  int get durationInMinutes;
  @override
  double get distanceInKilometers;
  @override
  double get baseCost;
  @override
  double get perMinuteCost;
  @override
  double get totalCost;
  @override
  String get paymentMethod;
  @override
  DateTime get issuedAt;

  /// Create a copy of TripReceipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripReceiptImplCopyWith<_$TripReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TripHistoryRequest {
  String get userId => throw _privateConstructorUsedError;
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  /// Create a copy of TripHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TripHistoryRequestCopyWith<TripHistoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripHistoryRequestCopyWith<$Res> {
  factory $TripHistoryRequestCopyWith(
          TripHistoryRequest value, $Res Function(TripHistoryRequest) then) =
      _$TripHistoryRequestCopyWithImpl<$Res, TripHistoryRequest>;
  @useResult
  $Res call({String userId, int? pageNumber, int? pageSize});
}

/// @nodoc
class _$TripHistoryRequestCopyWithImpl<$Res, $Val extends TripHistoryRequest>
    implements $TripHistoryRequestCopyWith<$Res> {
  _$TripHistoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TripHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TripHistoryRequestImplCopyWith<$Res>
    implements $TripHistoryRequestCopyWith<$Res> {
  factory _$$TripHistoryRequestImplCopyWith(_$TripHistoryRequestImpl value,
          $Res Function(_$TripHistoryRequestImpl) then) =
      __$$TripHistoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int? pageNumber, int? pageSize});
}

/// @nodoc
class __$$TripHistoryRequestImplCopyWithImpl<$Res>
    extends _$TripHistoryRequestCopyWithImpl<$Res, _$TripHistoryRequestImpl>
    implements _$$TripHistoryRequestImplCopyWith<$Res> {
  __$$TripHistoryRequestImplCopyWithImpl(_$TripHistoryRequestImpl _value,
      $Res Function(_$TripHistoryRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TripHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$TripHistoryRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      pageNumber: freezed == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$TripHistoryRequestImpl extends _TripHistoryRequest {
  const _$TripHistoryRequestImpl(
      {required this.userId, this.pageNumber, this.pageSize})
      : super._();

  @override
  final String userId;
  @override
  final int? pageNumber;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'TripHistoryRequest(userId: $userId, pageNumber: $pageNumber, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripHistoryRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, pageNumber, pageSize);

  /// Create a copy of TripHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TripHistoryRequestImplCopyWith<_$TripHistoryRequestImpl> get copyWith =>
      __$$TripHistoryRequestImplCopyWithImpl<_$TripHistoryRequestImpl>(
          this, _$identity);
}

abstract class _TripHistoryRequest extends TripHistoryRequest {
  const factory _TripHistoryRequest(
      {required final String userId,
      final int? pageNumber,
      final int? pageSize}) = _$TripHistoryRequestImpl;
  const _TripHistoryRequest._() : super._();

  @override
  String get userId;
  @override
  int? get pageNumber;
  @override
  int? get pageSize;

  /// Create a copy of TripHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TripHistoryRequestImplCopyWith<_$TripHistoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
