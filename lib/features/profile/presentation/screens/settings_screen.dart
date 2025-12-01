import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/custom_toggle_switch.dart';
import '../widgets/profile_list_item.dart';
import '../widgets/section_card.dart';
import 'edit_profile_screen.dart';

/// App settings screen with preferences and account options
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _pushNotificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _hapticFeedbackEnabled = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context, isDark),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Profile card
                      _buildProfileCard(context, isDark),

                      const SizedBox(height: 24),

                      // Preferences section
                      _buildPreferencesSection(context, isDark),

                      const SizedBox(height: 16),

                      // Account & Security section
                      _buildAccountSecuritySection(context, isDark),

                      const SizedBox(height: 16),

                      // About section
                      _buildAboutSection(context, isDark),

                      const SizedBox(height: 32),

                      // App version
                      _buildAppVersion(context, isDark),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: (isDark ? AppColors.darkBackground : AppColors.lightBackground)
            .withOpacity(0.8),
      ),
      child: Row(
        children: [
          // Back button
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pop(context),
            color: isDark
                ? AppColors.darkTextPrimary
                : AppColors.lightTextPrimary,
          ),

          // Title
          Expanded(
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
          ),

          // Spacer for centering
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
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
              size: 32,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 16),

          // Name and email
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Omar Achbani',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'omar@ecoride.ma',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                ),
              ],
            ),
          ),

          // Edit button
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(),
                ),
              );
            },
            child: Text(
              'Edit',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection(BuildContext context, bool isDark) {
    return SectionCard(
      children: [
        // Push Notifications
        ProfileListItem(
          icon: Icons.notifications,
          title: 'Push Notifications',
          iconBackgroundColor: AppColors.primary.withOpacity(0.1),
          iconColor: AppColors.primary,
          showChevron: false,
          trailing: CustomToggleSwitch(
            value: _pushNotificationsEnabled,
            onChanged: (value) {
              setState(() {
                _pushNotificationsEnabled = value;
              });
            },
          ),
        ),

        // Language
        ProfileListItem(
          icon: Icons.language,
          title: 'Language',
          iconBackgroundColor: AppColors.primary.withOpacity(0.1),
          iconColor: AppColors.primary,
          onTap: () {
            // TODO: Navigate to language selection
          },
        ),

        // Dark Mode
        ProfileListItem(
          icon: Icons.dark_mode,
          title: 'Dark Mode',
          iconBackgroundColor: AppColors.primary.withOpacity(0.1),
          iconColor: AppColors.primary,
          showChevron: false,
          trailing: CustomToggleSwitch(
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
              });
              // TODO: Implement theme switching
            },
          ),
        ),

        // Haptic Feedback
        ProfileListItem(
          icon: Icons.vibration,
          title: 'Haptic Feedback',
          iconBackgroundColor: AppColors.primary.withOpacity(0.1),
          iconColor: AppColors.primary,
          showChevron: false,
          trailing: CustomToggleSwitch(
            value: _hapticFeedbackEnabled,
            onChanged: (value) {
              setState(() {
                _hapticFeedbackEnabled = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAccountSecuritySection(BuildContext context, bool isDark) {
    return SectionCard(
      children: [
        // Change Password
        ProfileListItem(
          icon: Icons.lock,
          title: 'Change Password',
          iconBackgroundColor: const Color(0xFFD97706).withOpacity(0.1),
          iconColor: const Color(0xFFD97706),
          onTap: () {
            // TODO: Navigate to change password
          },
        ),

        // Privacy Settings
        ProfileListItem(
          icon: Icons.shield,
          title: 'Privacy Settings',
          iconBackgroundColor: const Color(0xFFD97706).withOpacity(0.1),
          iconColor: const Color(0xFFD97706),
          onTap: () {
            // TODO: Navigate to privacy settings
          },
        ),

        // Payment Methods
        ProfileListItem(
          icon: Icons.credit_card,
          title: 'Payment Methods',
          iconBackgroundColor: const Color(0xFFD97706).withOpacity(0.1),
          iconColor: const Color(0xFFD97706),
          onTap: () {
            // TODO: Navigate to payment methods
          },
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context, bool isDark) {
    return SectionCard(
      children: [
        // About EcoRide
        ProfileListItem(
          icon: Icons.info,
          title: 'About EcoRide',
          iconBackgroundColor: Colors.grey.withOpacity(0.1),
          iconColor: Colors.grey.shade600,
          onTap: () {
            // TODO: Navigate to about
          },
        ),

        // Terms of Service
        ProfileListItem(
          icon: Icons.gavel,
          title: 'Terms of Service',
          iconBackgroundColor: Colors.grey.withOpacity(0.1),
          iconColor: Colors.grey.shade600,
          onTap: () {
            // TODO: Navigate to terms of service
          },
        ),

        // Privacy Policy
        ProfileListItem(
          icon: Icons.policy,
          title: 'Privacy Policy',
          iconBackgroundColor: Colors.grey.withOpacity(0.1),
          iconColor: Colors.grey.shade600,
          onTap: () {
            // TODO: Navigate to privacy policy
          },
        ),
      ],
    );
  }

  Widget _buildAppVersion(BuildContext context, bool isDark) {
    return Center(
      child: Text(
        'EcoRide Version 1.0.0',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
      ),
    );
  }
}
