import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // TODO: Navigate to transaction history
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Balance Card
            Card(
              color: AppColors.primary,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Current Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '250.00 MAD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        _showAddFundsDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.primary,
                      ),
                      child: const Text('Add Funds'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Quick Add Amounts
            Text(
              'Quick Add',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _QuickAddButton(amount: 50, onTap: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _QuickAddButton(amount: 100, onTap: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _QuickAddButton(amount: 200, onTap: () {}),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _QuickAddButton(amount: 500, onTap: () {}),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Recent Transactions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: View all transactions
                  },
                  child: const Text('View All'),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Transaction List
            ...List.generate(
              5,
              (index) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? AppColors.success.withOpacity(0.2)
                          : AppColors.error.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      index % 2 == 0 ? Icons.add : Icons.remove,
                      color: index % 2 == 0 ? AppColors.success : AppColors.error,
                    ),
                  ),
                  title: Text(
                    index % 2 == 0 ? 'Top-up' : 'Trip Payment',
                  ),
                  subtitle: Text(
                    'Nov ${20 - index}, 2025',
                  ),
                  trailing: Text(
                    '${index % 2 == 0 ? '+' : '-'}${(index + 1) * 10}.00 MAD',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index % 2 == 0 ? AppColors.success : AppColors.error,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddFundsDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Funds'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                suffixText: 'MAD',
                hintText: 'Enter amount (10-1000 MAD)',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Minimum: 10 MAD\nMaximum: 1000 MAD',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement add funds
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final int amount;
  final VoidCallback onTap;

  const _QuickAddButton({
    required this.amount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: Text('$amount MAD'),
    );
  }
}
