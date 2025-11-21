import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({
    required T data,
    String? message,
  }) = Success<T>;

  const factory ApiResponse.error({
    required String message,
    String? code,
    int? statusCode,
    Map<String, dynamic>? details,
  }) = Error<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> items,
    required int pageNumber,
    required int pageSize,
    required int totalPages,
    required int totalCount,
    required bool hasPreviousPage,
    required bool hasNextPage,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);
}
