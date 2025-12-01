import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';

class HeroMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final bool isHighlighted;

  const HeroMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.unit,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted
            ? AppColors.primary.withOpacity(isDark ? 0.2 : 0.1)
            : (isDark ? AppColors.darkSurface : AppColors.lightSurface),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: isHighlighted
            ? Border.all(
                color: AppColors.primary,
                width: 2,
              )
            : null,
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isHighlighted
                      ? AppColors.primary.withOpacity(0.9)
                      : (isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
                  fontWeight: FontWeight.w500,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),

          // Value
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: isHighlighted
                      ? AppColors.primary
                      : (isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary),
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.5,
                ),
          ),
          const SizedBox(height: 2),

          // Unit
          Text(
            unit,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: isHighlighted
                      ? AppColors.primary.withOpacity(0.9)
                      : (isDark
                          ? AppColors.darkTextSecondary
                          : AppColors.lightTextSecondary),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.0,
                ),
          ),
        ],
      ),
    );
  }
}
