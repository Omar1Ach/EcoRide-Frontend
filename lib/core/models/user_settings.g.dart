// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsImpl _$$UserSettingsImplFromJson(Map<String, dynamic> json) =>
    _$UserSettingsImpl(
      pushNotificationsEnabled: json['pushNotificationsEnabled'] as bool,
      darkModeEnabled: json['darkModeEnabled'] as bool,
      hapticFeedbackEnabled: json['hapticFeedbackEnabled'] as bool,
      languageCode: json['languageCode'] as String,
    );

Map<String, dynamic> _$$UserSettingsImplToJson(_$UserSettingsImpl instance) =>
    <String, dynamic>{
      'pushNotificationsEnabled': instance.pushNotificationsEnabled,
      'darkModeEnabled': instance.darkModeEnabled,
      'hapticFeedbackEnabled': instance.hapticFeedbackEnabled,
      'languageCode': instance.languageCode,
    };
