import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/providers/auth_provider.dart';
import '../../../wallet/presentation/screens/wallet_screen.dart';
import '../../../trip/presentation/screens/trips_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

class DrawerMenu extends ConsumerWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(0)),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'drawer.hi'.tr(args: [user?.fullName.split(' ').first ?? 'Rider']),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildStatItem(context, '0', 'drawer.kilometers'.tr(), Icons.route),
                      const SizedBox(width: 32),
                      _buildStatItem(context, '0', 'drawer.rides'.tr(), Icons.electric_scooter),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Menu Items
            _buildMenuItem(
              context,
              icon: Icons.account_balance_wallet_outlined,
              title: 'wallet.title'.tr(),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WalletScreen()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.history,
              title: 'drawer.history'.tr(),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TripsScreen()),
                );
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.security,
              title: 'drawer.safety_center'.tr(),
              onTap: () {
                // TODO: Implement Safety Center
                Navigator.pop(context);
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.help_outline,
              title: 'drawer.help'.tr(),
              onTap: () {
                // TODO: Implement Help
                Navigator.pop(context);
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings_outlined,
              title: 'drawer.settings'.tr(),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            
            const Divider(height: 32, indent: 24, endIndent: 24),
            
            // Language Switcher
            _buildMenuItem(
              context,
              icon: Icons.language,
              title: 'drawer.language'.tr(),
              onTap: () => _showLanguageDialog(context),
            ),

            const Spacer(),

            // Footer
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'EcoRide v1.0.0',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textHint,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('drawer.language'.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption(context, 'English', const Locale('en')),
            _buildLanguageOption(context, 'Français', const Locale('fr')),
            _buildLanguageOption(context, 'العربية', const Locale('ar')),
            _buildLanguageOption(context, 'Español', const Locale('es')),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String name, Locale locale) {
    final isSelected = context.locale == locale;
    return ListTile(
      title: Text(name),
      trailing: isSelected ? const Icon(Icons.check, color: AppColors.primary) : null,
      onTap: () {
        context.setLocale(locale);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String value,
    String label,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary, size: 28),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      onTap: onTap,
    );
  }
}
