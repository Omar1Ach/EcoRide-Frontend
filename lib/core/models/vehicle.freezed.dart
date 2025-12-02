// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  String get id => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get batteryLevel => throw _privateConstructorUsedError;
  LocationData get location => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  DateTime? get lastMaintenanceDate => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {String id,
      String vehicleNumber,
      String vehicleType,
      String status,
      int batteryLevel,
      LocationData location,
      String qrCode,
      DateTime? lastMaintenanceDate,
      DateTime? createdAt});

  $LocationDataCopyWith<$Res> get location;
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleNumber = null,
    Object? vehicleType = null,
    Object? status = null,
    Object? batteryLevel = null,
    Object? location = null,
    Object? qrCode = null,
    Object? lastMaintenanceDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      lastMaintenanceDate: freezed == lastMaintenanceDate
          ? _value.lastMaintenanceDate
          : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<$Res> get location {
    return $LocationDataCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String vehicleNumber,
      String vehicleType,
      String status,
      int batteryLevel,
      LocationData location,
      String qrCode,
      DateTime? lastMaintenanceDate,
      DateTime? createdAt});

  @override
  $LocationDataCopyWith<$Res> get location;
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleNumber = null,
    Object? vehicleType = null,
    Object? status = null,
    Object? batteryLevel = null,
    Object? location = null,
    Object? qrCode = null,
    Object? lastMaintenanceDate = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$VehicleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      lastMaintenanceDate: freezed == lastMaintenanceDate
          ? _value.lastMaintenanceDate
          : lastMaintenanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl extends _Vehicle {
  const _$VehicleImpl(
      {required this.id,
      required this.vehicleNumber,
      required this.vehicleType,
      required this.status,
      required this.batteryLevel,
      required this.location,
      required this.qrCode,
      this.lastMaintenanceDate,
      this.createdAt})
      : super._();

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  final String id;
  @override
  final String vehicleNumber;
  @override
  final String vehicleType;
  @override
  final String status;
  @override
  final int batteryLevel;
  @override
  final LocationData location;
  @override
  final String qrCode;
  @override
  final DateTime? lastMaintenanceDate;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Vehicle(id: $id, vehicleNumber: $vehicleNumber, vehicleType: $vehicleType, status: $status, batteryLevel: $batteryLevel, location: $location, qrCode: $qrCode, lastMaintenanceDate: $lastMaintenanceDate, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.lastMaintenanceDate, lastMaintenanceDate) ||
                other.lastMaintenanceDate == lastMaintenanceDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, vehicleNumber, vehicleType,
      status, batteryLevel, location, qrCode, lastMaintenanceDate, createdAt);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle extends Vehicle {
  const factory _Vehicle(
      {required final String id,
      required final String vehicleNumber,
      required final String vehicleType,
      required final String status,
      required final int batteryLevel,
      required final LocationData location,
      required final String qrCode,
      final DateTime? lastMaintenanceDate,
      final DateTime? createdAt}) = _$VehicleImpl;
  const _Vehicle._() : super._();

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  String get id;
  @override
  String get vehicleNumber;
  @override
  String get vehicleType;
  @override
  String get status;
  @override
  int get batteryLevel;
  @override
  LocationData get location;
  @override
  String get qrCode;
  @override
  DateTime? get lastMaintenanceDate;
  @override
  DateTime? get createdAt;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
mixin _$LocationData {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationData
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
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
          _$LocationDataImpl value, $Res Function(_$LocationDataImpl) then) =
      __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
      _$LocationDataImpl _value, $Res Function(_$LocationDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationDataImpl(
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
@JsonSerializable()
class _$LocationDataImpl implements _LocationData {
  const _$LocationDataImpl({required this.latitude, required this.longitude});

  factory _$LocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataImplFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'LocationData(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataImplToJson(
      this,
    );
  }
}

abstract class _LocationData implements LocationData {
  const factory _LocationData(
      {required final double latitude,
      required final double longitude}) = _$LocationDataImpl;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$LocationDataImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of LocationData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicleSearchRequest {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double? get radiusInMeters => throw _privateConstructorUsedError;
  int? get minBatteryLevel => throw _privateConstructorUsedError;

  /// Create a copy of VehicleSearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleSearchRequestCopyWith<VehicleSearchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleSearchRequestCopyWith<$Res> {
  factory $VehicleSearchRequestCopyWith(VehicleSearchRequest value,
          $Res Function(VehicleSearchRequest) then) =
      _$VehicleSearchRequestCopyWithImpl<$Res, VehicleSearchRequest>;
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double? radiusInMeters,
      int? minBatteryLevel});
}

/// @nodoc
class _$VehicleSearchRequestCopyWithImpl<$Res,
        $Val extends VehicleSearchRequest>
    implements $VehicleSearchRequestCopyWith<$Res> {
  _$VehicleSearchRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleSearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radiusInMeters = freezed,
    Object? minBatteryLevel = freezed,
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
      radiusInMeters: freezed == radiusInMeters
          ? _value.radiusInMeters
          : radiusInMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      minBatteryLevel: freezed == minBatteryLevel
          ? _value.minBatteryLevel
          : minBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleSearchRequestImplCopyWith<$Res>
    implements $VehicleSearchRequestCopyWith<$Res> {
  factory _$$VehicleSearchRequestImplCopyWith(_$VehicleSearchRequestImpl value,
          $Res Function(_$VehicleSearchRequestImpl) then) =
      __$$VehicleSearchRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double latitude,
      double longitude,
      double? radiusInMeters,
      int? minBatteryLevel});
}

/// @nodoc
class __$$VehicleSearchRequestImplCopyWithImpl<$Res>
    extends _$VehicleSearchRequestCopyWithImpl<$Res, _$VehicleSearchRequestImpl>
    implements _$$VehicleSearchRequestImplCopyWith<$Res> {
  __$$VehicleSearchRequestImplCopyWithImpl(_$VehicleSearchRequestImpl _value,
      $Res Function(_$VehicleSearchRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleSearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radiusInMeters = freezed,
    Object? minBatteryLevel = freezed,
  }) {
    return _then(_$VehicleSearchRequestImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      radiusInMeters: freezed == radiusInMeters
          ? _value.radiusInMeters
          : radiusInMeters // ignore: cast_nullable_to_non_nullable
              as double?,
      minBatteryLevel: freezed == minBatteryLevel
          ? _value.minBatteryLevel
          : minBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$VehicleSearchRequestImpl extends _VehicleSearchRequest {
  const _$VehicleSearchRequestImpl(
      {required this.latitude,
      required this.longitude,
      this.radiusInMeters,
      this.minBatteryLevel})
      : super._();

  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double? radiusInMeters;
  @override
  final int? minBatteryLevel;

  @override
  String toString() {
    return 'VehicleSearchRequest(latitude: $latitude, longitude: $longitude, radiusInMeters: $radiusInMeters, minBatteryLevel: $minBatteryLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleSearchRequestImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radiusInMeters, radiusInMeters) ||
                other.radiusInMeters == radiusInMeters) &&
            (identical(other.minBatteryLevel, minBatteryLevel) ||
                other.minBatteryLevel == minBatteryLevel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, latitude, longitude, radiusInMeters, minBatteryLevel);

  /// Create a copy of VehicleSearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleSearchRequestImplCopyWith<_$VehicleSearchRequestImpl>
      get copyWith =>
          __$$VehicleSearchRequestImplCopyWithImpl<_$VehicleSearchRequestImpl>(
              this, _$identity);
}

abstract class _VehicleSearchRequest extends VehicleSearchRequest {
  const factory _VehicleSearchRequest(
      {required final double latitude,
      required final double longitude,
      final double? radiusInMeters,
      final int? minBatteryLevel}) = _$VehicleSearchRequestImpl;
  const _VehicleSearchRequest._() : super._();

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double? get radiusInMeters;
  @override
  int? get minBatteryLevel;

  /// Create a copy of VehicleSearchRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleSearchRequestImplCopyWith<_$VehicleSearchRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScanQrRequest {
  String get qrCode => throw _privateConstructorUsedError;

  /// Create a copy of ScanQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanQrRequestCopyWith<ScanQrRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQrRequestCopyWith<$Res> {
  factory $ScanQrRequestCopyWith(
          ScanQrRequest value, $Res Function(ScanQrRequest) then) =
      _$ScanQrRequestCopyWithImpl<$Res, ScanQrRequest>;
  @useResult
  $Res call({String qrCode});
}

/// @nodoc
class _$ScanQrRequestCopyWithImpl<$Res, $Val extends ScanQrRequest>
    implements $ScanQrRequestCopyWith<$Res> {
  _$ScanQrRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
  }) {
    return _then(_value.copyWith(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanQrRequestImplCopyWith<$Res>
    implements $ScanQrRequestCopyWith<$Res> {
  factory _$$ScanQrRequestImplCopyWith(
          _$ScanQrRequestImpl value, $Res Function(_$ScanQrRequestImpl) then) =
      __$$ScanQrRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String qrCode});
}

/// @nodoc
class __$$ScanQrRequestImplCopyWithImpl<$Res>
    extends _$ScanQrRequestCopyWithImpl<$Res, _$ScanQrRequestImpl>
    implements _$$ScanQrRequestImplCopyWith<$Res> {
  __$$ScanQrRequestImplCopyWithImpl(
      _$ScanQrRequestImpl _value, $Res Function(_$ScanQrRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
  }) {
    return _then(_$ScanQrRequestImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ScanQrRequestImpl extends _ScanQrRequest {
  const _$ScanQrRequestImpl({required this.qrCode}) : super._();

  @override
  final String qrCode;

  @override
  String toString() {
    return 'ScanQrRequest(qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQrRequestImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode);

  /// Create a copy of ScanQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanQrRequestImplCopyWith<_$ScanQrRequestImpl> get copyWith =>
      __$$ScanQrRequestImplCopyWithImpl<_$ScanQrRequestImpl>(this, _$identity);
}

abstract class _ScanQrRequest extends ScanQrRequest {
  const factory _ScanQrRequest({required final String qrCode}) =
      _$ScanQrRequestImpl;
  const _ScanQrRequest._() : super._();

  @override
  String get qrCode;

  /// Create a copy of ScanQrRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanQrRequestImplCopyWith<_$ScanQrRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScanQrResponse _$ScanQrResponseFromJson(Map<String, dynamic> json) {
  return _ScanQrResponse.fromJson(json);
}

/// @nodoc
mixin _$ScanQrResponse {
  String get vehicleId => throw _privateConstructorUsedError;
  String get vehicleNumber => throw _privateConstructorUsedError;
  String get vehicleType => throw _privateConstructorUsedError;
  int get batteryLevel => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this ScanQrResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScanQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScanQrResponseCopyWith<ScanQrResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQrResponseCopyWith<$Res> {
  factory $ScanQrResponseCopyWith(
          ScanQrResponse value, $Res Function(ScanQrResponse) then) =
      _$ScanQrResponseCopyWithImpl<$Res, ScanQrResponse>;
  @useResult
  $Res call(
      {String vehicleId,
      String vehicleNumber,
      String vehicleType,
      int batteryLevel,
      String status});
}

/// @nodoc
class _$ScanQrResponseCopyWithImpl<$Res, $Val extends ScanQrResponse>
    implements $ScanQrResponseCopyWith<$Res> {
  _$ScanQrResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScanQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? vehicleNumber = null,
    Object? vehicleType = null,
    Object? batteryLevel = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScanQrResponseImplCopyWith<$Res>
    implements $ScanQrResponseCopyWith<$Res> {
  factory _$$ScanQrResponseImplCopyWith(_$ScanQrResponseImpl value,
          $Res Function(_$ScanQrResponseImpl) then) =
      __$$ScanQrResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vehicleId,
      String vehicleNumber,
      String vehicleType,
      int batteryLevel,
      String status});
}

/// @nodoc
class __$$ScanQrResponseImplCopyWithImpl<$Res>
    extends _$ScanQrResponseCopyWithImpl<$Res, _$ScanQrResponseImpl>
    implements _$$ScanQrResponseImplCopyWith<$Res> {
  __$$ScanQrResponseImplCopyWithImpl(
      _$ScanQrResponseImpl _value, $Res Function(_$ScanQrResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScanQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? vehicleNumber = null,
    Object? vehicleType = null,
    Object? batteryLevel = null,
    Object? status = null,
  }) {
    return _then(_$ScanQrResponseImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleNumber: null == vehicleNumber
          ? _value.vehicleNumber
          : vehicleNumber // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleType: null == vehicleType
          ? _value.vehicleType
          : vehicleType // ignore: cast_nullable_to_non_nullable
              as String,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ScanQrResponseImpl implements _ScanQrResponse {
  const _$ScanQrResponseImpl(
      {required this.vehicleId,
      required this.vehicleNumber,
      required this.vehicleType,
      required this.batteryLevel,
      required this.status});

  factory _$ScanQrResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScanQrResponseImplFromJson(json);

  @override
  final String vehicleId;
  @override
  final String vehicleNumber;
  @override
  final String vehicleType;
  @override
  final int batteryLevel;
  @override
  final String status;

  @override
  String toString() {
    return 'ScanQrResponse(vehicleId: $vehicleId, vehicleNumber: $vehicleNumber, vehicleType: $vehicleType, batteryLevel: $batteryLevel, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQrResponseImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.vehicleNumber, vehicleNumber) ||
                other.vehicleNumber == vehicleNumber) &&
            (identical(other.vehicleType, vehicleType) ||
                other.vehicleType == vehicleType) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vehicleId, vehicleNumber, vehicleType, batteryLevel, status);

  /// Create a copy of ScanQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScanQrResponseImplCopyWith<_$ScanQrResponseImpl> get copyWith =>
      __$$ScanQrResponseImplCopyWithImpl<_$ScanQrResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScanQrResponseImplToJson(
      this,
    );
  }
}

abstract class _ScanQrResponse implements ScanQrResponse {
  const factory _ScanQrResponse(
      {required final String vehicleId,
      required final String vehicleNumber,
      required final String vehicleType,
      required final int batteryLevel,
      required final String status}) = _$ScanQrResponseImpl;

  factory _ScanQrResponse.fromJson(Map<String, dynamic> json) =
      _$ScanQrResponseImpl.fromJson;

  @override
  String get vehicleId;
  @override
  String get vehicleNumber;
  @override
  String get vehicleType;
  @override
  int get batteryLevel;
  @override
  String get status;

  /// Create a copy of ScanQrResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScanQrResponseImplCopyWith<_$ScanQrResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
