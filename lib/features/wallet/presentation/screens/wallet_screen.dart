import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/providers/wallet_provider.dart';
import '../../../../core/providers/auth_provider.dart';
import '../../../../core/models/wallet.dart';
import '../../../../core/widgets/loading/skeleton_loader.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
    _loadTransactionHistory();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _loadTransactionHistory() {
    final user = ref.read(currentUserProvider);
    if (user != null) {
      ref.invalidate(transactionHistoryProvider(
        TransactionHistoryRequest(userId: user.id, pageSize: 20),
      ));
    }
  }

  Future<void> _handleRefresh() async {
    await ref.read(walletBalanceProvider.notifier).refresh();
    _loadTransactionHistory();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final walletState = ref.watch(walletBalanceProvider);
    final user = ref.watch(currentUserProvider);

    final transactionHistoryState = user != null
        ? ref.watch(transactionHistoryProvider(
            TransactionHistoryRequest(userId: user.id, pageSize: 20),
          ))
        : const AsyncValue<List<WalletTransaction>>.data([]);

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Wallet',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.help_outline,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              size: 24,
            ),
            onPressed: () {
              // TODO: Navigate to help/FAQ screen
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: AppColors.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: FadeTransition(
            opacity: _animationController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Balance Card
                _buildBalanceCard(context, isDark, walletState),

                const SizedBox(height: 16),

                // Quick Action Buttons
                _buildQuickActionButtons(context, isDark),

                const SizedBox(height: 24),

                // Recent Activity Section
                _buildRecentActivitySection(context, isDark, transactionHistoryState),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(
    BuildContext context,
    bool isDark,
    AsyncValue<WalletBalance> walletState,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.darkTextSecondary : const Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 8),
          walletState.when(
            data: (balance) => Text(
              '${balance.balance.toStringAsFixed(2)} MAD',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                letterSpacing: -0.5,
              ),
            ),
            loading: () => const SkeletonLoader(width: 200, height: 40),
            error: (err, _) => Text(
              'Error loading balance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.error,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {
                // TODO: Navigate to top-up screen
              },
              icon: const Icon(Icons.add_card, size: 20),
              label: const Text('Top Up'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.darkBackground,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButtons(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            context,
            isDark,
            icon: Icons.credit_card,
            label: 'Payment Methods',
            onTap: () {
              // TODO: Navigate to payment methods screen
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildActionButton(
            context,
            isDark,
            icon: Icons.history,
            label: 'Transaction History',
            onTap: () {
              // TODO: Navigate to full transaction history screen
            },
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    bool isDark, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceVariant : const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivitySection(
    BuildContext context,
    bool isDark,
    AsyncValue<List<WalletTransaction>> transactionHistoryState,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
        ),
        const SizedBox(height: 12),
        transactionHistoryState.when(
          data: (transactions) {
            if (transactions.isEmpty) {
              return _buildEmptyState(context, isDark);
            }
            return Column(
              children: transactions.map((transaction) {
                return _buildTransactionItem(context, isDark, transaction);
              }).toList(),
            );
          },
          loading: () => Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildTransactionSkeleton(isDark),
              ),
            ),
          ),
          error: (err, _) => _buildErrorState(context, isDark, err.toString()),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    bool isDark,
    WalletTransaction transaction,
  ) {
    final isTopUp = transaction.transactionType.toLowerCase().contains('topup') ||
        transaction.transactionType.toLowerCase().contains('top-up') ||
        transaction.transactionType.toLowerCase().contains('deposit') ||
        transaction.transactionType.toLowerCase().contains('add_funds');

    final isFailed = transaction.transactionType.toLowerCase().contains('failed') ||
        transaction.transactionType.toLowerCase().contains('cancelled') ||
        transaction.transactionType.toLowerCase().contains('rejected');

    final isRide = transaction.transactionType.toLowerCase().contains('ride') ||
        transaction.transactionType.toLowerCase().contains('trip') ||
        transaction.transactionType.toLowerCase().contains('payment');

    IconData iconData;
    Color iconColor;

    if (isFailed) {
      iconData = Icons.cancel;
      iconColor = AppColors.error;
    } else if (isTopUp) {
      iconData = Icons.add_circle;
      iconColor = AppColors.success;
    } else if (isRide) {
      iconData = Icons.electric_scooter;
      iconColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    } else {
      iconData = Icons.receipt;
      iconColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    }

    final amountColor = isFailed
        ? AppColors.error
        : isTopUp
            ? AppColors.success
            : isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary;

    final amountPrefix = transaction.amount > 0 ? '+' : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : const Color(0xFFE5E7EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurfaceVariant : const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          // Transaction Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.description ?? _getTransactionTitle(transaction.transactionType),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTransactionDate(transaction.transactionDate),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: isDark ? AppColors.darkTextSecondary : const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Amount
          Text(
            '$amountPrefix${transaction.amount.abs().toStringAsFixed(2)} MAD',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionSkeleton(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.transparent : const Color(0xFFE5E7EB).withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SkeletonLoader(
            width: 48,
            height: 48,
            borderRadius: 12,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonLoader(width: 150, height: 16),
                SizedBox(height: 8),
                SkeletonLoader(width: 100, height: 14),
              ],
            ),
          ),
          const SizedBox(width: 12),
          const SkeletonLoader(width: 80, height: 16),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            'No transactions yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your recent activity will appear here',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, bool isDark, String error) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: AppColors.error,
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _handleRefresh,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.darkBackground,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  String _getTransactionTitle(String transactionType) {
    // Convert transaction type to readable title
    final type = transactionType.toLowerCase();
    if (type.contains('topup') || type.contains('top-up') || type.contains('deposit')) {
      return 'Wallet Top-Up';
    } else if (type.contains('ride') || type.contains('trip')) {
      return 'Scooter Ride';
    } else if (type.contains('failed') || type.contains('cancelled')) {
      return 'Top-Up Failed';
    } else if (type.contains('refund')) {
      return 'Refund';
    }
    return transactionType;
  }

  String _formatTransactionDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) {
      return 'Today, ${_formatTime(date)}';
    } else if (transactionDate == yesterday) {
      return 'Yesterday, ${_formatTime(date)}';
    } else if (now.difference(date).inDays < 7) {
      return '${_getDayName(date.weekday)}, ${_formatTime(date)}';
    } else {
      return '${_getMonthName(date.month)} ${date.day}, ${_formatTime(date)}';
    }
  }

  String _formatTime(DateTime date) {
    final hour = date.hour > 12 ? date.hour - 12 : (date.hour == 0 ? 12 : date.hour);
    final minute = date.minute.toString().padLeft(2, '0');
    final period = date.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  String _getDayName(int weekday) {
    const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
