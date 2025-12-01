import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../widgets/hero_metric_card.dart';
import '../widgets/secondary_stat_chip.dart';
import '../widgets/alert_banner.dart';
import '../widgets/hold_to_end_button.dart';

class ActiveTripScreen extends ConsumerStatefulWidget {
  const ActiveTripScreen({super.key});

  @override
  ConsumerState<ActiveTripScreen> createState() => _ActiveTripScreenState();
}

class _ActiveTripScreenState extends ConsumerState<ActiveTripScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: AppTheme.normalDuration,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Sticky Header
            _buildHeader(context, isDark),

            // Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Hero Metrics Section
                      _buildHeroMetrics(context),
                      const SizedBox(height: 24),

                      // Secondary Stats Section
                      _buildSecondaryStats(),
                      const SizedBox(height: 24),

                      // Mini-Map
                      _buildMiniMap(context),
                      const SizedBox(height: 24),

                      // Alert Banners
                      _buildAlertBanners(),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Action Bar
            _buildBottomActionBar(context, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBackground.withOpacity(0.8)
            : AppColors.lightBackground.withOpacity(0.8),
        border: Border(
          bottom: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Active Badge
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppTheme.radiusFull),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.electric_bike,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  'Active',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),

          // Title
          Text(
            'Trip in Progress',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),

          // SOS Button
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.sos, size: 20),
              color: AppColors.error,
              onPressed: () {
                // Handle SOS
                _handleSOS(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroMetrics(BuildContext context) {
    return Row(
      children: [
        // Duration Card
        Expanded(
          child: HeroMetricCard(
            label: 'Duration',
            value: '08:32',
            unit: 'MINS',
            isHighlighted: false,
          ),
        ),
        const SizedBox(width: 12),

        // Current Cost Card (Highlighted)
        Expanded(
          child: HeroMetricCard(
            label: 'Current Cost',
            value: '12.50',
            unit: 'MAD',
            isHighlighted: true,
          ),
        ),
        const SizedBox(width: 12),

        // Distance Card
        Expanded(
          child: HeroMetricCard(
            label: 'Distance',
            value: '2.1',
            unit: 'KM',
            isHighlighted: false,
          ),
        ),
      ],
    );
  }

  Widget _buildSecondaryStats() {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: const [
          SecondaryStatChip(
            icon: Icons.speed,
            label: '15 KM/H',
          ),
          SizedBox(width: 12),
          SecondaryStatChip(
            icon: Icons.battery_5_bar,
            label: '65%',
          ),
          SizedBox(width: 12),
          SecondaryStatChip(
            icon: Icons.cloud,
            label: '150 G',
          ),
          SizedBox(width: 12),
          SecondaryStatChip(
            icon: Icons.thermostat,
            label: '24°C',
          ),
        ],
      ),
    );
  }

  Widget _buildMiniMap(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        child: Stack(
          children: [
            // Map Placeholder
            Container(
              color: isDark
                  ? AppColors.darkSurfaceVariant
                  : AppColors.lightSurfaceVariant,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 64,
                      color: isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Route Map',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                    ),
                  ],
                ),
              ),
            ),

            // Route marker (example)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.navigation,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertBanners() {
    return Column(
      children: const [
        AlertBanner(
          icon: Icons.battery_alert,
          message: 'Low Battery: Find a charging station soon.',
          type: AlertType.warning,
        ),
        SizedBox(height: 12),
        AlertBanner(
          icon: Icons.wrong_location,
          message: 'You are leaving the designated service area.',
          type: AlertType.error,
        ),
      ],
    );
  }

  Widget _buildBottomActionBar(BuildContext context, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkBackground.withOpacity(0.9)
            : AppColors.lightBackground.withOpacity(0.9),
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Pause Button
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDark
                    ? AppColors.darkBorder.withOpacity(0.5)
                    : AppColors.lightBorder,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            child: IconButton(
              icon: const Icon(Icons.pause, size: 28),
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
              onPressed: () {
                // Handle pause
                _handlePause(context);
              },
            ),
          ),
          const SizedBox(width: 16),

          // Hold to End Trip Button
          Expanded(
            child: HoldToEndButton(
              onComplete: () {
                // Handle end trip
                _handleEndTrip(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleSOS(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Emergency SOS'),
        content: const Text(
          'Are you in an emergency? This will alert our support team and local authorities.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle SOS action
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: const Text('Send SOS'),
          ),
        ],
      ),
    );
  }

  void _handlePause(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trip paused'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleEndTrip(BuildContext context) {
    // Navigate to trip summary
    // Navigator.pushNamed(context, '/trip-summary');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Trip ended successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
