// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletBalanceImpl _$$WalletBalanceImplFromJson(Map<String, dynamic> json) =>
    _$WalletBalanceImpl(
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$WalletBalanceImplToJson(_$WalletBalanceImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

_$WalletTransactionImpl _$$WalletTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$WalletTransactionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionType: json['transactionType'] as String,
      paymentMethod: json['paymentMethod'] as String,
      paymentDetails: json['paymentDetails'] as String?,
      description: json['description'] as String?,
      balanceBefore: (json['balanceBefore'] as num).toDouble(),
      balanceAfter: (json['balanceAfter'] as num).toDouble(),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
    );

Map<String, dynamic> _$$WalletTransactionImplToJson(
        _$WalletTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
      'paymentMethod': instance.paymentMethod,
      'paymentDetails': instance.paymentDetails,
      'description': instance.description,
      'balanceBefore': instance.balanceBefore,
      'balanceAfter': instance.balanceAfter,
      'transactionDate': instance.transactionDate.toIso8601String(),
    };
