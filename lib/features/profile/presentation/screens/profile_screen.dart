import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../auth/presentation/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primary.withOpacity(0.2),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Omar Achbani',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'omar@ecoride.ma',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '+212 612 345 678',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Account Section
            _buildSectionTitle(context, 'Account'),
            _buildMenuItem(
              context,
              icon: Icons.edit_outlined,
              title: 'Edit Profile',
              onTap: () {
                // TODO: Navigate to edit profile
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.lock_outlined,
              title: 'Change Password',
              onTap: () {
                // TODO: Navigate to change password
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              onTap: () {
                // TODO: Navigate to notifications settings
              },
            ),

            const SizedBox(height: 24),

            // Support Section
            _buildSectionTitle(context, 'Support'),
            _buildMenuItem(
              context,
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {
                // TODO: Navigate to help center
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {
                // TODO: Show about dialog
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {
                // TODO: Show privacy policy
              },
            ),
            _buildMenuItem(
              context,
              icon: Icons.description_outlined,
              title: 'Terms of Service',
              onTap: () {
                // TODO: Show terms of service
              },
            ),

            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                ),
                child: const Text('Logout'),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Version 1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
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
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
