import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/haptics.dart';
import 'otp_verification_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _selectedCountryCode = '+212';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSendCode() async {
    if (_formKey.currentState!.validate()) {
      Haptics.light();
      final phoneNumber = '$_selectedCountryCode${_phoneController.text.trim()}';

      // Navigate to OTP screen
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => OtpVerificationScreen(
            phoneNumber: phoneNumber,
          ),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: AppTheme.normalDuration,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          // Background Map Image with Blur
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_background.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback gradient background
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isDark
                          ? [
                              AppColors.darkBackground,
                              AppColors.darkSurface,
                            ]
                          : [
                              AppColors.lightBackground,
                              AppColors.lightSurface,
                            ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Blur Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              children: [
                // Logo Header
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, bottom: 16),
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 128,
                      height: 48,
                      fit: BoxFit.contain,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: -0.2, end: 0),
                ),

                const Spacer(),

                // Glassmorphism Card
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.black.withOpacity(0.7)
                          : Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isDark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 40,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Title
                                Text(
                                  'Enter your mobile number',
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : AppColors.lightTextPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                                    .animate()
                                    .fadeIn(delay: 200.ms)
                                    .slideY(begin: 0.2, end: 0),

                                const SizedBox(height: 8),

                                // Subtitle
                                Text(
                                  "We'll send you a confirmation code.",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: isDark
                                        ? AppColors.darkTextSecondary
                                        : AppColors.lightTextSecondary,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                                    .animate()
                                    .fadeIn(delay: 300.ms)
                                    .slideY(begin: 0.2, end: 0),

                                const SizedBox(height: 24),

                                // Phone Number Input Container
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? AppColors.darkSurfaceVariant
                                        : AppColors.lightSurface,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.all(4),
                                  child: Row(
                                    children: [
                                      // Country Selector Button
                                      InkWell(
                                        onTap: () {
                                          // TODO: Show country picker
                                          Haptics.light();
                                        },
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 12,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Text(
                                                '🇲🇦',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                _selectedCountryCode,
                                                style: theme.textTheme.bodyLarge
                                                    ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: isDark
                                                      ? AppColors.darkTextPrimary
                                                      : AppColors
                                                          .lightTextPrimary,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: isDark
                                                    ? AppColors.darkTextSecondary
                                                    : AppColors
                                                        .lightTextSecondary,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Phone Number Input
                                      Expanded(
                                        child: TextFormField(
                                          controller: _phoneController,
                                          keyboardType: TextInputType.phone,
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(
                                            color: isDark
                                                ? AppColors.darkTextPrimary
                                                : AppColors.lightTextPrimary,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: '6 12 34 56 78',
                                            hintStyle: theme.textTheme.bodyLarge
                                                ?.copyWith(
                                              color: isDark
                                                  ? AppColors.darkTextHint
                                                  : AppColors.lightTextHint,
                                            ),
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 12,
                                            ),
                                          ),
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(10),
                                          ],
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your phone number';
                                            }
                                            if (value.length < 9) {
                                              return 'Phone number is too short';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                    .animate()
                                    .fadeIn(delay: 400.ms)
                                    .slideY(begin: 0.2, end: 0),

                                const SizedBox(height: 16),

                                // Send Code Button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: _handleSendCode,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                      shadowColor: AppColors.primary
                                          .withOpacity(0.3),
                                    ),
                                    child: Text(
                                      'Send Code',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                    .animate()
                                    .fadeIn(delay: 500.ms)
                                    .scale(begin: const Offset(0.9, 0.9)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: 100.ms)
                    .slideY(begin: 0.3, end: 0),

                // Terms and Privacy
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                  child: Text.rich(
                    TextSpan(
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isDark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                      children: [
                        const TextSpan(
                          text: 'By continuing, you agree to our ',
                        ),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const TextSpan(text: '.'),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(delay: 600.ms),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
