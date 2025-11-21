import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';
part 'wallet.g.dart';

@freezed
class WalletBalance with _$WalletBalance {
  const factory WalletBalance({
    required String userId,
    required double balance,
    required DateTime lastUpdated,
  }) = _WalletBalance;

  factory WalletBalance.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceFromJson(json);
}

@freezed
class AddFundsRequest with _$AddFundsRequest {
  const AddFundsRequest._();

  const factory AddFundsRequest({
    required String userId,
    required double amount,
    required String paymentMethod,
    String? paymentDetails,
  }) = _AddFundsRequest;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'amount': amount,
        'paymentMethod': paymentMethod,
        if (paymentDetails != null) 'paymentDetails': paymentDetails,
      };
}

@freezed
class WalletTransaction with _$WalletTransaction {
  const factory WalletTransaction({
    required String id,
    required String userId,
    required double amount,
    required String transactionType,
    required String paymentMethod,
    String? paymentDetails,
    String? description,
    required double balanceBefore,
    required double balanceAfter,
    required DateTime transactionDate,
  }) = _WalletTransaction;

  factory WalletTransaction.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionFromJson(json);
}

@freezed
class TransactionHistoryRequest with _$TransactionHistoryRequest {
  const TransactionHistoryRequest._();

  const factory TransactionHistoryRequest({
    required String userId,
    int? pageNumber,
    int? pageSize,
  }) = _TransactionHistoryRequest;

  Map<String, dynamic> toQueryParameters() => {
        'userId': userId,
        if (pageNumber != null) 'pageNumber': pageNumber.toString(),
        if (pageSize != null) 'pageSize': pageSize.toString(),
      };
}
