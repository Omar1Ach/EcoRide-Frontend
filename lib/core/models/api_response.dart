import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';

// Generic response wrapper - no JSON serialization needed
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
}

// Generic paginated response - no JSON serialization needed
@Freezed(genericArgumentFactories: true)
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
}
