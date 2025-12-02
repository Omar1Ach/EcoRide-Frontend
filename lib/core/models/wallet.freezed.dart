// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletBalance _$WalletBalanceFromJson(Map<String, dynamic> json) {
  return _WalletBalance.fromJson(json);
}

/// @nodoc
mixin _$WalletBalance {
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this WalletBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletBalanceCopyWith<WalletBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletBalanceCopyWith<$Res> {
  factory $WalletBalanceCopyWith(
          WalletBalance value, $Res Function(WalletBalance) then) =
      _$WalletBalanceCopyWithImpl<$Res, WalletBalance>;
  @useResult
  $Res call({String userId, double balance, DateTime lastUpdated});
}

/// @nodoc
class _$WalletBalanceCopyWithImpl<$Res, $Val extends WalletBalance>
    implements $WalletBalanceCopyWith<$Res> {
  _$WalletBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletBalanceImplCopyWith<$Res>
    implements $WalletBalanceCopyWith<$Res> {
  factory _$$WalletBalanceImplCopyWith(
          _$WalletBalanceImpl value, $Res Function(_$WalletBalanceImpl) then) =
      __$$WalletBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, double balance, DateTime lastUpdated});
}

/// @nodoc
class __$$WalletBalanceImplCopyWithImpl<$Res>
    extends _$WalletBalanceCopyWithImpl<$Res, _$WalletBalanceImpl>
    implements _$$WalletBalanceImplCopyWith<$Res> {
  __$$WalletBalanceImplCopyWithImpl(
      _$WalletBalanceImpl _value, $Res Function(_$WalletBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$WalletBalanceImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletBalanceImpl implements _WalletBalance {
  const _$WalletBalanceImpl(
      {required this.userId, required this.balance, required this.lastUpdated});

  factory _$WalletBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletBalanceImplFromJson(json);

  @override
  final String userId;
  @override
  final double balance;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'WalletBalance(userId: $userId, balance: $balance, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletBalanceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, balance, lastUpdated);

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletBalanceImplCopyWith<_$WalletBalanceImpl> get copyWith =>
      __$$WalletBalanceImplCopyWithImpl<_$WalletBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletBalanceImplToJson(
      this,
    );
  }
}

abstract class _WalletBalance implements WalletBalance {
  const factory _WalletBalance(
      {required final String userId,
      required final double balance,
      required final DateTime lastUpdated}) = _$WalletBalanceImpl;

  factory _WalletBalance.fromJson(Map<String, dynamic> json) =
      _$WalletBalanceImpl.fromJson;

  @override
  String get userId;
  @override
  double get balance;
  @override
  DateTime get lastUpdated;

  /// Create a copy of WalletBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletBalanceImplCopyWith<_$WalletBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddFundsRequest {
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentDetails => throw _privateConstructorUsedError;

  /// Create a copy of AddFundsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddFundsRequestCopyWith<AddFundsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFundsRequestCopyWith<$Res> {
  factory $AddFundsRequestCopyWith(
          AddFundsRequest value, $Res Function(AddFundsRequest) then) =
      _$AddFundsRequestCopyWithImpl<$Res, AddFundsRequest>;
  @useResult
  $Res call(
      {String userId,
      double amount,
      String paymentMethod,
      String? paymentDetails});
}

/// @nodoc
class _$AddFundsRequestCopyWithImpl<$Res, $Val extends AddFundsRequest>
    implements $AddFundsRequestCopyWith<$Res> {
  _$AddFundsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddFundsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? paymentDetails = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddFundsRequestImplCopyWith<$Res>
    implements $AddFundsRequestCopyWith<$Res> {
  factory _$$AddFundsRequestImplCopyWith(_$AddFundsRequestImpl value,
          $Res Function(_$AddFundsRequestImpl) then) =
      __$$AddFundsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      double amount,
      String paymentMethod,
      String? paymentDetails});
}

/// @nodoc
class __$$AddFundsRequestImplCopyWithImpl<$Res>
    extends _$AddFundsRequestCopyWithImpl<$Res, _$AddFundsRequestImpl>
    implements _$$AddFundsRequestImplCopyWith<$Res> {
  __$$AddFundsRequestImplCopyWithImpl(
      _$AddFundsRequestImpl _value, $Res Function(_$AddFundsRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddFundsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amount = null,
    Object? paymentMethod = null,
    Object? paymentDetails = freezed,
  }) {
    return _then(_$AddFundsRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddFundsRequestImpl extends _AddFundsRequest {
  const _$AddFundsRequestImpl(
      {required this.userId,
      required this.amount,
      required this.paymentMethod,
      this.paymentDetails})
      : super._();

  @override
  final String userId;
  @override
  final double amount;
  @override
  final String paymentMethod;
  @override
  final String? paymentDetails;

  @override
  String toString() {
    return 'AddFundsRequest(userId: $userId, amount: $amount, paymentMethod: $paymentMethod, paymentDetails: $paymentDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFundsRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentDetails, paymentDetails) ||
                other.paymentDetails == paymentDetails));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, amount, paymentMethod, paymentDetails);

  /// Create a copy of AddFundsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFundsRequestImplCopyWith<_$AddFundsRequestImpl> get copyWith =>
      __$$AddFundsRequestImplCopyWithImpl<_$AddFundsRequestImpl>(
          this, _$identity);
}

abstract class _AddFundsRequest extends AddFundsRequest {
  const factory _AddFundsRequest(
      {required final String userId,
      required final double amount,
      required final String paymentMethod,
      final String? paymentDetails}) = _$AddFundsRequestImpl;
  const _AddFundsRequest._() : super._();

  @override
  String get userId;
  @override
  double get amount;
  @override
  String get paymentMethod;
  @override
  String? get paymentDetails;

  /// Create a copy of AddFundsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddFundsRequestImplCopyWith<_$AddFundsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) {
  return _WalletTransaction.fromJson(json);
}

/// @nodoc
mixin _$WalletTransaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentDetails => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double get balanceBefore => throw _privateConstructorUsedError;
  double get balanceAfter => throw _privateConstructorUsedError;
  DateTime get transactionDate => throw _privateConstructorUsedError;

  /// Serializes this WalletTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletTransactionCopyWith<WalletTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTransactionCopyWith<$Res> {
  factory $WalletTransactionCopyWith(
          WalletTransaction value, $Res Function(WalletTransaction) then) =
      _$WalletTransactionCopyWithImpl<$Res, WalletTransaction>;
  @useResult
  $Res call(
      {String id,
      String userId,
      double amount,
      String transactionType,
      String paymentMethod,
      String? paymentDetails,
      String? description,
      double balanceBefore,
      double balanceAfter,
      DateTime transactionDate});
}

/// @nodoc
class _$WalletTransactionCopyWithImpl<$Res, $Val extends WalletTransaction>
    implements $WalletTransactionCopyWith<$Res> {
  _$WalletTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? transactionType = null,
    Object? paymentMethod = null,
    Object? paymentDetails = freezed,
    Object? description = freezed,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? transactionDate = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletTransactionImplCopyWith<$Res>
    implements $WalletTransactionCopyWith<$Res> {
  factory _$$WalletTransactionImplCopyWith(_$WalletTransactionImpl value,
          $Res Function(_$WalletTransactionImpl) then) =
      __$$WalletTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      double amount,
      String transactionType,
      String paymentMethod,
      String? paymentDetails,
      String? description,
      double balanceBefore,
      double balanceAfter,
      DateTime transactionDate});
}

/// @nodoc
class __$$WalletTransactionImplCopyWithImpl<$Res>
    extends _$WalletTransactionCopyWithImpl<$Res, _$WalletTransactionImpl>
    implements _$$WalletTransactionImplCopyWith<$Res> {
  __$$WalletTransactionImplCopyWithImpl(_$WalletTransactionImpl _value,
      $Res Function(_$WalletTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? transactionType = null,
    Object? paymentMethod = null,
    Object? paymentDetails = freezed,
    Object? description = freezed,
    Object? balanceBefore = null,
    Object? balanceAfter = null,
    Object? transactionDate = null,
  }) {
    return _then(_$WalletTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      paymentDetails: freezed == paymentDetails
          ? _value.paymentDetails
          : paymentDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceBefore: null == balanceBefore
          ? _value.balanceBefore
          : balanceBefore // ignore: cast_nullable_to_non_nullable
              as double,
      balanceAfter: null == balanceAfter
          ? _value.balanceAfter
          : balanceAfter // ignore: cast_nullable_to_non_nullable
              as double,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletTransactionImpl implements _WalletTransaction {
  const _$WalletTransactionImpl(
      {required this.id,
      required this.userId,
      required this.amount,
      required this.transactionType,
      required this.paymentMethod,
      this.paymentDetails,
      this.description,
      required this.balanceBefore,
      required this.balanceAfter,
      required this.transactionDate});

  factory _$WalletTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String transactionType;
  @override
  final String paymentMethod;
  @override
  final String? paymentDetails;
  @override
  final String? description;
  @override
  final double balanceBefore;
  @override
  final double balanceAfter;
  @override
  final DateTime transactionDate;

  @override
  String toString() {
    return 'WalletTransaction(id: $id, userId: $userId, amount: $amount, transactionType: $transactionType, paymentMethod: $paymentMethod, paymentDetails: $paymentDetails, description: $description, balanceBefore: $balanceBefore, balanceAfter: $balanceAfter, transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentDetails, paymentDetails) ||
                other.paymentDetails == paymentDetails) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.balanceBefore, balanceBefore) ||
                other.balanceBefore == balanceBefore) &&
            (identical(other.balanceAfter, balanceAfter) ||
                other.balanceAfter == balanceAfter) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      amount,
      transactionType,
      paymentMethod,
      paymentDetails,
      description,
      balanceBefore,
      balanceAfter,
      transactionDate);

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      __$$WalletTransactionImplCopyWithImpl<_$WalletTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletTransactionImplToJson(
      this,
    );
  }
}

abstract class _WalletTransaction implements WalletTransaction {
  const factory _WalletTransaction(
      {required final String id,
      required final String userId,
      required final double amount,
      required final String transactionType,
      required final String paymentMethod,
      final String? paymentDetails,
      final String? description,
      required final double balanceBefore,
      required final double balanceAfter,
      required final DateTime transactionDate}) = _$WalletTransactionImpl;

  factory _WalletTransaction.fromJson(Map<String, dynamic> json) =
      _$WalletTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get amount;
  @override
  String get transactionType;
  @override
  String get paymentMethod;
  @override
  String? get paymentDetails;
  @override
  String? get description;
  @override
  double get balanceBefore;
  @override
  double get balanceAfter;
  @override
  DateTime get transactionDate;

  /// Create a copy of WalletTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletTransactionImplCopyWith<_$WalletTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionHistoryRequest {
  String get userId => throw _privateConstructorUsedError;
  int? get pageNumber => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;

  /// Create a copy of TransactionHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionHistoryRequestCopyWith<TransactionHistoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryRequestCopyWith<$Res> {
  factory $TransactionHistoryRequestCopyWith(TransactionHistoryRequest value,
          $Res Function(TransactionHistoryRequest) then) =
      _$TransactionHistoryRequestCopyWithImpl<$Res, TransactionHistoryRequest>;
  @useResult
  $Res call({String userId, int? pageNumber, int? pageSize});
}

/// @nodoc
class _$TransactionHistoryRequestCopyWithImpl<$Res,
        $Val extends TransactionHistoryRequest>
    implements $TransactionHistoryRequestCopyWith<$Res> {
  _$TransactionHistoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionHistoryRequest
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
abstract class _$$TransactionHistoryRequestImplCopyWith<$Res>
    implements $TransactionHistoryRequestCopyWith<$Res> {
  factory _$$TransactionHistoryRequestImplCopyWith(
          _$TransactionHistoryRequestImpl value,
          $Res Function(_$TransactionHistoryRequestImpl) then) =
      __$$TransactionHistoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, int? pageNumber, int? pageSize});
}

/// @nodoc
class __$$TransactionHistoryRequestImplCopyWithImpl<$Res>
    extends _$TransactionHistoryRequestCopyWithImpl<$Res,
        _$TransactionHistoryRequestImpl>
    implements _$$TransactionHistoryRequestImplCopyWith<$Res> {
  __$$TransactionHistoryRequestImplCopyWithImpl(
      _$TransactionHistoryRequestImpl _value,
      $Res Function(_$TransactionHistoryRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? pageNumber = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$TransactionHistoryRequestImpl(
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

class _$TransactionHistoryRequestImpl extends _TransactionHistoryRequest {
  const _$TransactionHistoryRequestImpl(
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
    return 'TransactionHistoryRequest(userId: $userId, pageNumber: $pageNumber, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionHistoryRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, pageNumber, pageSize);

  /// Create a copy of TransactionHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionHistoryRequestImplCopyWith<_$TransactionHistoryRequestImpl>
      get copyWith => __$$TransactionHistoryRequestImplCopyWithImpl<
          _$TransactionHistoryRequestImpl>(this, _$identity);
}

abstract class _TransactionHistoryRequest extends TransactionHistoryRequest {
  const factory _TransactionHistoryRequest(
      {required final String userId,
      final int? pageNumber,
      final int? pageSize}) = _$TransactionHistoryRequestImpl;
  const _TransactionHistoryRequest._() : super._();

  @override
  String get userId;
  @override
  int? get pageNumber;
  @override
  int? get pageSize;

  /// Create a copy of TransactionHistoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionHistoryRequestImplCopyWith<_$TransactionHistoryRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
