import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../widgets/profile_list_item.dart';
import '../widgets/section_card.dart';
import 'edit_profile_screen.dart';

/// User profile screen with modern UI design
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Header with Close and Done buttons
            _buildHeader(context),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Section
                    _buildProfileSection(context),

                    // Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: isDark ? AppColors.darkDivider : AppColors.lightDivider,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Account Section
                    _buildAccountSection(context),

                    const SizedBox(height: 16),

                    // Legal & Support Section
                    _buildLegalSupportSection(context),

                    const SizedBox(height: 32),

                    // Log Out Button
                    _buildLogoutButton(context),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Close button
          SizedBox(
            width: 48,
            height: 48,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          // Title
          Expanded(
            child: Text(
              'Profile',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),

          // Done button
          SizedBox(
            width: 48,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Done',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile avatar
          Container(
            width: 128,
            height: 128,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.7),
                  AppColors.primary.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Icon(
              Icons.person,
              size: 64,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // User name
          Text(
            'Omar Achbani',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 4),

          // Email
          Text(
            'omar@ecoride.ma',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : AppColors.lightTextSecondary,
                ),
          ),

          const SizedBox(height: 16),

          // Change Photo button
          Container(
            constraints: const BoxConstraints(maxWidth: 480),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement image picker
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary.withOpacity(0.2),
                foregroundColor: AppColors.primary,
                elevation: 0,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                ),
              ),
              child: const Text(
                'Change Photo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              'Account',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          const SizedBox(height: 8),

          // Account items
          SectionCard(
            children: [
              ProfileListItem(
                icon: Icons.person_outline,
                title: 'Personal Details',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
              ProfileListItem(
                icon: Icons.link,
                title: 'Connected Accounts',
                onTap: () {
                  // TODO: Navigate to connected accounts
                },
              ),
              ProfileListItem(
                icon: Icons.credit_card,
                title: 'Payment Methods',
                onTap: () {
                  // TODO: Navigate to payment methods
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegalSupportSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Text(
              'Legal & Support',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          const SizedBox(height: 8),

          // Legal & Support items
          SectionCard(
            children: [
              ProfileListItem(
                icon: Icons.help_outline,
                title: 'Help Center',
                onTap: () {
                  // TODO: Navigate to help center
                },
              ),
              ProfileListItem(
                icon: Icons.gavel,
                title: 'Terms of Service',
                onTap: () {
                  // TODO: Navigate to terms of service
                },
              ),
              ProfileListItem(
                icon: Icons.shield_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  // TODO: Navigate to privacy policy
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            _showLogoutDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isDark
                ? AppColors.darkSurface.withOpacity(0.5)
                : const Color(0xFFF5F5F5),
            foregroundColor: isDark
                ? const Color(0xFFFF6B6B)
                : const Color(0xFFEF5350),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            ),
          ),
          child: const Text(
            'Log Out',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement logout logic
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
