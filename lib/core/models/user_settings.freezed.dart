// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  bool get pushNotificationsEnabled => throw _privateConstructorUsedError;
  bool get darkModeEnabled => throw _privateConstructorUsedError;
  bool get hapticFeedbackEnabled => throw _privateConstructorUsedError;
  String get languageCode => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {bool pushNotificationsEnabled,
      bool darkModeEnabled,
      bool hapticFeedbackEnabled,
      String languageCode});
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotificationsEnabled = null,
    Object? darkModeEnabled = null,
    Object? hapticFeedbackEnabled = null,
    Object? languageCode = null,
  }) {
    return _then(_value.copyWith(
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      darkModeEnabled: null == darkModeEnabled
          ? _value.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedbackEnabled: null == hapticFeedbackEnabled
          ? _value.hapticFeedbackEnabled
          : hapticFeedbackEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool pushNotificationsEnabled,
      bool darkModeEnabled,
      bool hapticFeedbackEnabled,
      String languageCode});
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotificationsEnabled = null,
    Object? darkModeEnabled = null,
    Object? hapticFeedbackEnabled = null,
    Object? languageCode = null,
  }) {
    return _then(_$UserSettingsImpl(
      pushNotificationsEnabled: null == pushNotificationsEnabled
          ? _value.pushNotificationsEnabled
          : pushNotificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      darkModeEnabled: null == darkModeEnabled
          ? _value.darkModeEnabled
          : darkModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      hapticFeedbackEnabled: null == hapticFeedbackEnabled
          ? _value.hapticFeedbackEnabled
          : hapticFeedbackEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl(
      {required this.pushNotificationsEnabled,
      required this.darkModeEnabled,
      required this.hapticFeedbackEnabled,
      required this.languageCode});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  final bool pushNotificationsEnabled;
  @override
  final bool darkModeEnabled;
  @override
  final bool hapticFeedbackEnabled;
  @override
  final String languageCode;

  @override
  String toString() {
    return 'UserSettings(pushNotificationsEnabled: $pushNotificationsEnabled, darkModeEnabled: $darkModeEnabled, hapticFeedbackEnabled: $hapticFeedbackEnabled, languageCode: $languageCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(
                    other.pushNotificationsEnabled, pushNotificationsEnabled) ||
                other.pushNotificationsEnabled == pushNotificationsEnabled) &&
            (identical(other.darkModeEnabled, darkModeEnabled) ||
                other.darkModeEnabled == darkModeEnabled) &&
            (identical(other.hapticFeedbackEnabled, hapticFeedbackEnabled) ||
                other.hapticFeedbackEnabled == hapticFeedbackEnabled) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pushNotificationsEnabled,
      darkModeEnabled, hapticFeedbackEnabled, languageCode);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {required final bool pushNotificationsEnabled,
      required final bool darkModeEnabled,
      required final bool hapticFeedbackEnabled,
      required final String languageCode}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  bool get pushNotificationsEnabled;
  @override
  bool get darkModeEnabled;
  @override
  bool get hapticFeedbackEnabled;
  @override
  String get languageCode;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
