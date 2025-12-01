import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/providers/auth_provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../map/presentation/screens/map_screen.dart';
import 'login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _gradientController;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..repeat();
    _checkAuth();
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  Future<void> _checkAuth() async {
    // Artificial delay for animation
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final authState =
        await ref.read(authStateProvider.notifier).checkAuthStatus();

    if (!mounted) return;

    if (authState) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MapScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: AppTheme.normalDuration,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: const [
                  Color(0xFF6ee7b7),
                  Color(0xFF34d399),
                  Color(0xFF059669),
                  Color(0xFF065f46),
                ],
                stops: [
                  (_gradientController.value * 0.25) % 1,
                  (_gradientController.value * 0.5) % 1,
                  (_gradientController.value * 0.75) % 1,
                  _gradientController.value,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Main Content
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Logo Image
                          Container(
                            width: 192,
                            height: 192,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/logo.png',
                                width: 144,
                                height: 144,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                              .animate()
                              .scale(
                                duration: 800.ms,
                                curve: Curves.easeOutBack,
                              )
                              .fadeIn(duration: 600.ms),

                          const SizedBox(height: 32),

                          // App Name
                          Text(
                            'EcoRide',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                          )
                              .animate()
                              .fadeIn(
                                delay: 500.ms,
                                duration: 800.ms,
                              )
                              .slideY(
                                begin: 0.3,
                                end: 0,
                                delay: 500.ms,
                                duration: 800.ms,
                              ),

                          const SizedBox(height: 12),

                          // Tagline
                          Text(
                            'Your Moroccan journey, electrified.',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 0.5,
                                    ),
                            textAlign: TextAlign.center,
                          )
                              .animate()
                              .fadeIn(
                                delay: 1000.ms,
                                duration: 800.ms,
                              )
                              .slideY(
                                begin: 0.3,
                                end: 0,
                                delay: 1000.ms,
                                duration: 800.ms,
                              ),
                        ],
                      ),
                    ),
                  ),

                  // Footer
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text.rich(
                      TextSpan(
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : Colors.white.withOpacity(0.8),
                            ),
                        children: [
                          const TextSpan(
                            text: 'By continuing, you agree to our ',
                          ),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(
                            text: ' and ',
                          ),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    )
                        .animate()
                        .fadeIn(
                          delay: 1500.ms,
                          duration: 800.ms,
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
