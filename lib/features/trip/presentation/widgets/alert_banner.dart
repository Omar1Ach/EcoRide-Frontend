import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';

enum AlertType { warning, error, info, success }

class AlertBanner extends StatelessWidget {
  final IconData icon;
  final String message;
  final AlertType type;

  const AlertBanner({
    super.key,
    required this.icon,
    required this.message,
    this.type = AlertType.info,
  });

  Color _getBackgroundColor() {
    switch (type) {
      case AlertType.warning:
        return AppColors.warning.withValues(alpha: 0.2);
      case AlertType.error:
        return AppColors.error.withValues(alpha: 0.2);
      case AlertType.info:
        return AppColors.info.withValues(alpha: 0.2);
      case AlertType.success:
        return AppColors.success.withValues(alpha: 0.2);
    }
  }

  Color _getIconColor() {
    switch (type) {
      case AlertType.warning:
        return AppColors.warning;
      case AlertType.error:
        return AppColors.error;
      case AlertType.info:
        return AppColors.info;
      case AlertType.success:
        return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: _getIconColor(),
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: _getIconColor(),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
