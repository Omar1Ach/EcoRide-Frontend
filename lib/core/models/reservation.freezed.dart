// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get reservedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime? get cancelledAt => throw _privateConstructorUsedError;

  /// Serializes this Reservation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String vehicleId,
      String status,
      DateTime reservedAt,
      DateTime expiresAt,
      DateTime? cancelledAt});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleId = null,
    Object? status = null,
    Object? reservedAt = null,
    Object? expiresAt = null,
    Object? cancelledAt = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reservedAt: null == reservedAt
          ? _value.reservedAt
          : reservedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationImplCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$ReservationImplCopyWith(
          _$ReservationImpl value, $Res Function(_$ReservationImpl) then) =
      __$$ReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String vehicleId,
      String status,
      DateTime reservedAt,
      DateTime expiresAt,
      DateTime? cancelledAt});
}

/// @nodoc
class __$$ReservationImplCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$ReservationImpl>
    implements _$$ReservationImplCopyWith<$Res> {
  __$$ReservationImplCopyWithImpl(
      _$ReservationImpl _value, $Res Function(_$ReservationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? vehicleId = null,
    Object? status = null,
    Object? reservedAt = null,
    Object? expiresAt = null,
    Object? cancelledAt = freezed,
  }) {
    return _then(_$ReservationImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      reservedAt: null == reservedAt
          ? _value.reservedAt
          : reservedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cancelledAt: freezed == cancelledAt
          ? _value.cancelledAt
          : cancelledAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReservationImpl implements _Reservation {
  const _$ReservationImpl(
      {required this.id,
      required this.userId,
      required this.vehicleId,
      required this.status,
      required this.reservedAt,
      required this.expiresAt,
      this.cancelledAt});

  factory _$ReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String vehicleId;
  @override
  final String status;
  @override
  final DateTime reservedAt;
  @override
  final DateTime expiresAt;
  @override
  final DateTime? cancelledAt;

  @override
  String toString() {
    return 'Reservation(id: $id, userId: $userId, vehicleId: $vehicleId, status: $status, reservedAt: $reservedAt, expiresAt: $expiresAt, cancelledAt: $cancelledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reservedAt, reservedAt) ||
                other.reservedAt == reservedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.cancelledAt, cancelledAt) ||
                other.cancelledAt == cancelledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, vehicleId, status,
      reservedAt, expiresAt, cancelledAt);

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      __$$ReservationImplCopyWithImpl<_$ReservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationImplToJson(
      this,
    );
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation(
      {required final String id,
      required final String userId,
      required final String vehicleId,
      required final String status,
      required final DateTime reservedAt,
      required final DateTime expiresAt,
      final DateTime? cancelledAt}) = _$ReservationImpl;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$ReservationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get vehicleId;
  @override
  String get status;
  @override
  DateTime get reservedAt;
  @override
  DateTime get expiresAt;
  @override
  DateTime? get cancelledAt;

  /// Create a copy of Reservation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateReservationRequest {
  String get vehicleId => throw _privateConstructorUsedError;

  /// Create a copy of CreateReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReservationRequestCopyWith<CreateReservationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReservationRequestCopyWith<$Res> {
  factory $CreateReservationRequestCopyWith(CreateReservationRequest value,
          $Res Function(CreateReservationRequest) then) =
      _$CreateReservationRequestCopyWithImpl<$Res, CreateReservationRequest>;
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class _$CreateReservationRequestCopyWithImpl<$Res,
        $Val extends CreateReservationRequest>
    implements $CreateReservationRequestCopyWith<$Res> {
  _$CreateReservationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_value.copyWith(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReservationRequestImplCopyWith<$Res>
    implements $CreateReservationRequestCopyWith<$Res> {
  factory _$$CreateReservationRequestImplCopyWith(
          _$CreateReservationRequestImpl value,
          $Res Function(_$CreateReservationRequestImpl) then) =
      __$$CreateReservationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String vehicleId});
}

/// @nodoc
class __$$CreateReservationRequestImplCopyWithImpl<$Res>
    extends _$CreateReservationRequestCopyWithImpl<$Res,
        _$CreateReservationRequestImpl>
    implements _$$CreateReservationRequestImplCopyWith<$Res> {
  __$$CreateReservationRequestImplCopyWithImpl(
      _$CreateReservationRequestImpl _value,
      $Res Function(_$CreateReservationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
  }) {
    return _then(_$CreateReservationRequestImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateReservationRequestImpl extends _CreateReservationRequest {
  const _$CreateReservationRequestImpl({required this.vehicleId}) : super._();

  @override
  final String vehicleId;

  @override
  String toString() {
    return 'CreateReservationRequest(vehicleId: $vehicleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReservationRequestImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleId);

  /// Create a copy of CreateReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReservationRequestImplCopyWith<_$CreateReservationRequestImpl>
      get copyWith => __$$CreateReservationRequestImplCopyWithImpl<
          _$CreateReservationRequestImpl>(this, _$identity);
}

abstract class _CreateReservationRequest extends CreateReservationRequest {
  const factory _CreateReservationRequest({required final String vehicleId}) =
      _$CreateReservationRequestImpl;
  const _CreateReservationRequest._() : super._();

  @override
  String get vehicleId;

  /// Create a copy of CreateReservationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReservationRequestImplCopyWith<_$CreateReservationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateReservationResponse _$CreateReservationResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateReservationResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateReservationResponse {
  String get reservationId => throw _privateConstructorUsedError;
  String get vehicleId => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this CreateReservationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateReservationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateReservationResponseCopyWith<CreateReservationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateReservationResponseCopyWith<$Res> {
  factory $CreateReservationResponseCopyWith(CreateReservationResponse value,
          $Res Function(CreateReservationResponse) then) =
      _$CreateReservationResponseCopyWithImpl<$Res, CreateReservationResponse>;
  @useResult
  $Res call(
      {String reservationId,
      String vehicleId,
      DateTime expiresAt,
      String message});
}

/// @nodoc
class _$CreateReservationResponseCopyWithImpl<$Res,
        $Val extends CreateReservationResponse>
    implements $CreateReservationResponseCopyWith<$Res> {
  _$CreateReservationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateReservationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
    Object? vehicleId = null,
    Object? expiresAt = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateReservationResponseImplCopyWith<$Res>
    implements $CreateReservationResponseCopyWith<$Res> {
  factory _$$CreateReservationResponseImplCopyWith(
          _$CreateReservationResponseImpl value,
          $Res Function(_$CreateReservationResponseImpl) then) =
      __$$CreateReservationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reservationId,
      String vehicleId,
      DateTime expiresAt,
      String message});
}

/// @nodoc
class __$$CreateReservationResponseImplCopyWithImpl<$Res>
    extends _$CreateReservationResponseCopyWithImpl<$Res,
        _$CreateReservationResponseImpl>
    implements _$$CreateReservationResponseImplCopyWith<$Res> {
  __$$CreateReservationResponseImplCopyWithImpl(
      _$CreateReservationResponseImpl _value,
      $Res Function(_$CreateReservationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateReservationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reservationId = null,
    Object? vehicleId = null,
    Object? expiresAt = null,
    Object? message = null,
  }) {
    return _then(_$CreateReservationResponseImpl(
      reservationId: null == reservationId
          ? _value.reservationId
          : reservationId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
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
class _$CreateReservationResponseImpl implements _CreateReservationResponse {
  const _$CreateReservationResponseImpl(
      {required this.reservationId,
      required this.vehicleId,
      required this.expiresAt,
      required this.message});

  factory _$CreateReservationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateReservationResponseImplFromJson(json);

  @override
  final String reservationId;
  @override
  final String vehicleId;
  @override
  final DateTime expiresAt;
  @override
  final String message;

  @override
  String toString() {
    return 'CreateReservationResponse(reservationId: $reservationId, vehicleId: $vehicleId, expiresAt: $expiresAt, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateReservationResponseImpl &&
            (identical(other.reservationId, reservationId) ||
                other.reservationId == reservationId) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reservationId, vehicleId, expiresAt, message);

  /// Create a copy of CreateReservationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateReservationResponseImplCopyWith<_$CreateReservationResponseImpl>
      get copyWith => __$$CreateReservationResponseImplCopyWithImpl<
          _$CreateReservationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateReservationResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateReservationResponse implements CreateReservationResponse {
  const factory _CreateReservationResponse(
      {required final String reservationId,
      required final String vehicleId,
      required final DateTime expiresAt,
      required final String message}) = _$CreateReservationResponseImpl;

  factory _CreateReservationResponse.fromJson(Map<String, dynamic> json) =
      _$CreateReservationResponseImpl.fromJson;

  @override
  String get reservationId;
  @override
  String get vehicleId;
  @override
  DateTime get expiresAt;
  @override
  String get message;

  /// Create a copy of CreateReservationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateReservationResponseImplCopyWith<_$CreateReservationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
