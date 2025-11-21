import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallet.dart';
import '../models/api_response.dart';
import 'service_providers.dart';
import 'auth_provider.dart';

// Wallet Balance Provider
final walletBalanceProvider =
    StateNotifierProvider<WalletBalanceNotifier, AsyncValue<WalletBalance>>(
  (ref) => WalletBalanceNotifier(ref),
);

class WalletBalanceNotifier extends StateNotifier<AsyncValue<WalletBalance>> {
  final Ref ref;

  WalletBalanceNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadBalance();
  }

  Future<void> _loadBalance() async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      state = AsyncValue.error('User not authenticated', StackTrace.current);
      return;
    }

    final walletService = ref.read(walletServiceProvider);
    final response = await walletService.getBalance(user.id);

    if (response is Success<WalletBalance>) {
      state = AsyncValue.data(response.data);
    } else if (response is Error<WalletBalance>) {
      state = AsyncValue.error(response.message, StackTrace.current);
    }
  }

  Future<bool> addFunds(double amount, String paymentMethod) async {
    final user = ref.read(currentUserProvider);
    if (user == null) return false;

    state = const AsyncValue.loading();

    final walletService = ref.read(walletServiceProvider);
    final request = AddFundsRequest(
      userId: user.id,
      amount: amount,
      paymentMethod: paymentMethod,
    );

    final response = await walletService.addFunds(request);

    if (response is Success<WalletBalance>) {
      state = AsyncValue.data(response.data);
      return true;
    } else if (response is Error<WalletBalance>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  Future<void> refresh() => _loadBalance();
}

// Transaction History Provider
final transactionHistoryProvider = FutureProvider.family<
    List<WalletTransaction>,
    TransactionHistoryRequest>((ref, request) async {
  final walletService = ref.read(walletServiceProvider);
  final response = await walletService.getTransactionHistory(request);

  if (response is Success<List<WalletTransaction>>) {
    return response.data;
  } else if (response is Error<List<WalletTransaction>>) {
    throw Exception(response.message);
  }

  return [];
});
