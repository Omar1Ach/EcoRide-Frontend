import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String fullName,
    required String email,
    required String phoneNumber,
    required bool isPhoneVerified,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String email,
    required DateTime expiresAt,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) = _RegisterRequest;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

@freezed
class VerifyOtpRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String userId,
    required String otpCode,
  }) = _VerifyOtpRequest;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'otpCode': otpCode,
      };
}
