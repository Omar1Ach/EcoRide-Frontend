import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: 'Find a ride',
      description: 'Explore the city with ease. Find the nearest scooter on the map.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBXnuQcqvmox_BMaBlB_cjHRIu4NpYTm8FNzjBSLyU72oBsxv6COKEivybq8QfPNS3suGiSZVsK-ORy3WbLCxTyB9zun5hbXgEsD13ELE5ZK_nsyVKSwRGZ5ttHSaiDD_4poUfzVXcy7_hdmqFXxbYxT40UEirKdIYP5sWY-_q_aiDfR1aaDgeYpJQ56LZfZEBCGXwqevH5B7Zp60P0H_LDbZ-4mhhVvQHekTI_6jERM62vZqaYpiOaUJSPqEw8qpxpdcjqgMdf6-Nt',
    ),
    OnboardingData(
      title: 'Ride in style',
      description: 'Scan the QR code to unlock and start your journey through Morocco.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBI4WIo0fFZY3GVeOpQQqYXo3lg4q5Xc_ag0gM-b1boZmcnb0dExBAjuRiKz3nJeyJwAL_0ptA4ZsPG8PnJjtViecVLr6oLpQEfKem4yFHz2yTbYeaCAXwSJ4wSHLzmm0WoVUFv03HNdLq0k30iMGqFXp3egsISAJwJWZE2zCnH_5GMkSwMROupdOXvbzgCKaHr-yYPiijmTEp5RTc0L3Cw3fWtaEx8g9IamvC7DmeNy9DdEe9RBNnDwGWbpeKQVYiEuI77GwNGMijB',
    ),
    OnboardingData(
      title: 'Pay securely',
      description: 'End your ride and pay hassle-free with our secure payment system.',
      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA-0CFW97CXXPWdu-0kL-In6DVS6Sz5KqvQIgdVmNagSc2cf2M24GymDrdoWL7xUC6rsypjzvBd_sCpb1YYTGbSzlZOdvm1KV5ot88gV8BfyA2K84eC2lRtI48GdG1-vzWkvz7I1Qx-qyk6LHmW4035QzPm0UyCu66RwSiHq-FGy0IHniDDEwXj_dlFbIfWeMpWRFPIONpKEG4gZq-GIidXZ0YRVAZ2hHgOe-p67cgxRGVD3GXC8E5jS-xWnNXnk59lIZFG9b5Pl0_s',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (page != _currentPage) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSkip() {
    // Navigate to home or login screen
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _onGetStarted() {
    // Navigate to home or login screen
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header with Skip button
              _buildHeader(isDark),

              const SizedBox(height: 20),

              // Main Content - PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildPage(_pages[index], isDark);
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Footer with pagination and button
              _buildFooter(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _onSkip,
        child: Text(
          'Skip',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingData data, bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image
        Image.network(
          data.imageUrl,
          width: 288,
          height: 288,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return SizedBox(
              width: 288,
              height: 288,
              child: Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                      : null,
                  color: AppColors.primary,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 288,
              height: 288,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurfaceVariant,
                borderRadius: BorderRadius.circular(AppTheme.radiusXl),
              ),
              child: Icon(
                Icons.image_not_supported_outlined,
                size: 64,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              ),
            );
          },
        ),

        const SizedBox(height: 32),

        // Title
        Text(
          data.title,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        // Description
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 320),
          child: Text(
            data.description,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter(bool isDark) {
    return Column(
      children: [
        // Pagination dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _pages.length,
            (index) => AnimatedContainer(
              duration: AppTheme.normalDuration,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? AppColors.primary
                    : isDark
                        ? AppColors.darkSurfaceVariant
                        : AppColors.lightSurfaceVariant,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Get Started button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onGetStarted,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
              elevation: 0,
              shadowColor: AppColors.primary.withValues(alpha: 0.2),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
            ),
            child: Text(
              'Get Started',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
