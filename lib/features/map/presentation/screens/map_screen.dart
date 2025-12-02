import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/models/vehicle.dart';
import '../../../../core/providers/vehicle_provider.dart';
import '../../../../core/providers/auth_provider.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/haptics.dart';
import '../../../../core/widgets/bottom_sheets/premium_bottom_sheet.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import 'qr_scanner_screen.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  final DraggableScrollableController _bottomSheetController = DraggableScrollableController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LatLng _currentLocation = const LatLng(33.5731, -7.5898); // Casablanca default
  bool _isLoadingLocation = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _bottomSheetController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _isLoadingLocation = false);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => _isLoadingLocation = false);
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      if (!mounted) return;

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoadingLocation = false;
      });

      _mapController.move(_currentLocation, 15.0);
      _loadVehicles();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoadingLocation = false);
    }
  }

  void _loadVehicles() {
    final request = VehicleSearchRequest(
      latitude: _currentLocation.latitude,
      longitude: _currentLocation.longitude,
      radiusInMeters: 5000,
    );
    ref.read(nearbyVehiclesProvider(request).notifier).refresh();
  }

  void _centerOnUserLocation() {
    Haptics.selection();
    _mapController.move(_currentLocation, 15.0);
    _loadVehicles();
  }

  void _onVehicleMarkerTap(Vehicle vehicle) {
    Haptics.selection();
    _showVehicleDetails(vehicle);
  }

  Color _getBatteryColor(int batteryLevel) {
    if (batteryLevel > 60) {
      return AppColors.batteryHigh;
    } else if (batteryLevel >= 30) {
      return AppColors.batteryMedium;
    } else {
      return AppColors.batteryLow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = VehicleSearchRequest(
      latitude: _currentLocation.latitude,
      longitude: _currentLocation.longitude,
      radiusInMeters: 5000,
    );
    final vehiclesState = ref.watch(nearbyVehiclesProvider(request));
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context, user, isDark),
      body: Stack(
        children: [
          // Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentLocation,
              initialZoom: 15.0,
              minZoom: 5.0,
              maxZoom: 18.0,
              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),
            ),
            children: [
              // Map Tiles
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.ecoride',
                maxZoom: 19,
              ),

              // Vehicle Markers
              vehiclesState.when(
                data: (vehicles) => MarkerLayer(
                  markers: vehicles.map((vehicle) {
                    return Marker(
                      point: LatLng(vehicle.location.latitude, vehicle.location.longitude),
                      width: 70,
                      height: 70,
                      child: GestureDetector(
                        onTap: () => _onVehicleMarkerTap(vehicle),
                        child: _buildVehicleMarker(vehicle),
                      ),
                    );
                  }).toList(),
                ),
                loading: () => const MarkerLayer(markers: []),
                error: (_, __) => const MarkerLayer(markers: []),
              ),

              // User Location Marker
              if (!_isLoadingLocation)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentLocation,
                      width: 50,
                      height: 50,
                      child: _buildUserLocationMarker(),
                    ),
                  ],
                ),
            ],
          ),

          // Glassmorphism Top Bar
          _buildTopBar(context, isDark),

          // Map Controls (Zoom & Location)
          _buildMapControls(context, isDark),

          // Loading Indicator
          if (_isLoadingLocation || vehiclesState.isLoading)
            _buildLoadingIndicator(context),

          // Bottom Sheet with Nearby Vehicles
          vehiclesState.when(
            data: (vehicles) => _buildBottomSheet(context, vehicles, isDark),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, dynamic user, bool isDark) {
    final userName = user?.fullName ?? 'User';
    final firstName = userName.split(' ').first;

    return Drawer(
      child: Container(
        color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Greeting
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'Hi $firstName',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Stats Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.electric_scooter,
                                  color: AppColors.primary,
                                  size: 28,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '0',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Kilometers',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scaleX: -1,
                                  child: Icon(
                                    Icons.electric_scooter,
                                    color: AppColors.primary,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '0',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Rides',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Navigation Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(
                      context,
                      icon: Icons.account_balance_wallet,
                      label: 'Wallet',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Wallet
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.history,
                      label: 'History',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to History
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.verified_user,
                      label: 'Safety Center',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Safety Center
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.help_outline,
                      label: 'Help',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Help
                      },
                    ),
                    _buildDrawerItem(
                      context,
                      icon: Icons.settings,
                      label: 'Settings',
                      onTap: () {
                        Navigator.pop(context);
                        // Navigate to Settings
                      },
                    ),
                  ],
                ),
              ),

              // App Version
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  'EcoRide v1.0.0 (1)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark ? AppColors.darkTextHint : AppColors.lightTextHint,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      leading: Icon(
        icon,
        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
      ),
      title: Text(
        label,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Haptics.light();
        onTap();
      },
    );
  }

  Widget _buildTopBar(BuildContext context, bool isDark) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkSurface.withOpacity(0.6)
                      : Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorder.withOpacity(0.2)
                        : Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    // Menu Button
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSurfaceVariant.withOpacity(0.5)
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Haptics.light();
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.menu,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Search Field
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurfaceVariant.withOpacity(0.5)
                              : Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Where to?',
                            hintStyle: TextStyle(
                              color: isDark ? AppColors.darkTextHint : AppColors.lightTextHint,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: isDark ? AppColors.darkTextHint : AppColors.lightTextHint,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          style: TextStyle(
                            color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                          ),
                          onTap: () {
                            // Open search/destination screen
                          },
                          readOnly: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Filter Button
                    Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppColors.darkSurfaceVariant.withOpacity(0.5)
                            : Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Haptics.light();
                            _showVehicleTypes(context);
                          },
                          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.tune,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapControls(BuildContext context, bool isDark) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 80,
      right: AppSpacing.md,
      child: Column(
        children: [
          // Zoom Controls
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Haptics.light();
                      _mapController.move(
                        _mapController.camera.center,
                        _mapController.camera.zoom + 1,
                      );
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppTheme.radiusLg),
                      topRight: Radius.circular(AppTheme.radiusLg),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.add,
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Haptics.light();
                      _mapController.move(
                        _mapController.camera.center,
                        _mapController.camera.zoom - 1,
                      );
                    },
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppTheme.radiusLg),
                      bottomRight: Radius.circular(AppTheme.radiusLg),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        Icons.remove,
                        color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // My Location Button
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _centerOnUserLocation,
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    Icons.my_location,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 100,
      left: AppSpacing.lg,
      right: AppSpacing.lg,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Text(
              _isLoadingLocation ? 'map.getting_location'.tr() : 'common.loading'.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ).animate().fadeIn().slideY(begin: -0.5),
    );
  }

  Widget _buildBottomSheet(BuildContext context, List<Vehicle> vehicles, bool isDark) {
    // Calculate distance for each vehicle (simplified - using lat/lng difference)
    final vehiclesWithDistance = vehicles.map((vehicle) {
      final distance = Geolocator.distanceBetween(
        _currentLocation.latitude,
        _currentLocation.longitude,
        vehicle.location.latitude,
        vehicle.location.longitude,
      );
      return MapEntry(vehicle, distance);
    }).toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return DraggableScrollableSheet(
      controller: _bottomSheetController,
      initialChildSize: 0.35,
      minChildSize: 0.2,
      maxChildSize: 0.7,
      snap: true,
      snapSizes: const [0.2, 0.35, 0.7],
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBackground : AppColors.lightBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppTheme.radiusXl),
              topRight: Radius.circular(AppTheme.radiusXl),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Drag Handle
              Container(
                margin: const EdgeInsets.only(top: 8, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkTextHint : AppColors.lightTextHint,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Wallet Balance & Distance Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Wallet Balance',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          ),
                        ),
                        Text(
                          '\$25.50',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '12 mins',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                          ),
                        ),
                        Text(
                          '0.8 km',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Nearby Vehicles Title
              Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nearby vehicles',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Vehicles List
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: vehiclesWithDistance.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final entry = vehiclesWithDistance[index];
                    final vehicle = entry.key;
                    final distance = entry.value;

                    return _buildVehicleListItem(vehicle, distance, isDark, index);
                  },
                ),
              ),

              // Scan Button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF91E686), Color(0xFF13EC6A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => _handleScanButton(context),
                      borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.qr_code_scanner,
                              color: Colors.black,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Scan',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVehicleListItem(Vehicle vehicle, double distance, bool isDark, int index) {
    final distanceText = distance < 1000
        ? '${distance.round()}m'
        : '${(distance / 1000).toStringAsFixed(1)}km';

    final batteryColor = _getBatteryColor(vehicle.batteryLevel);
    final isAvailable = vehicle.isAvailable;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Row(
        children: [
          // Vehicle Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            child: Icon(
              vehicle.isBike ? Icons.pedal_bike : Icons.electric_scooter,
              color: AppColors.primary,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          // Vehicle Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicle.vehicleNumber,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      distanceText,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Transform.rotate(
                      angle: 1.5708, // 90 degrees in radians
                      child: Icon(
                        Icons.battery_full,
                        color: batteryColor,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${vehicle.batteryLevel}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: batteryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action Button
          ElevatedButton(
            onPressed: isAvailable
                ? () {
                    Haptics.success();
                    _onVehicleMarkerTap(vehicle);
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isAvailable ? AppColors.primary : null,
              foregroundColor: isAvailable ? Colors.white : null,
              disabledBackgroundColor: isDark ? AppColors.darkSurfaceVariant : AppColors.lightSurfaceVariant,
              disabledForegroundColor: isDark ? AppColors.darkTextHint : AppColors.lightTextHint,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
              elevation: 0,
            ),
            child: Text(
              isAvailable ? 'Reserve' : 'In use',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 50 * index)).slideX(begin: 0.2);
  }

  Future<void> _handleScanButton(BuildContext context) async {
    Haptics.medium();
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QrScannerScreen(),
      ),
    );

    if (result != null && mounted) {
      // Handle scanned code via provider
      final success = await ref.read(qrScannerProvider.notifier).scanQrCode(result);

      if (!mounted) return;

      if (success) {
        Haptics.success();
        final scanResponse = ref.read(qrScannerProvider).value;
        if (scanResponse != null) {
          // Fetch full vehicle details or construct temporary one
          final vehicle = Vehicle(
            id: scanResponse.vehicleId,
            vehicleNumber: scanResponse.vehicleNumber,
            vehicleType: scanResponse.vehicleType,
            status: scanResponse.status,
            batteryLevel: scanResponse.batteryLevel,
            location: const LocationData(latitude: 0, longitude: 0),
            qrCode: result,
          );
          _showVehicleDetails(vehicle);
        }
      } else {
        Haptics.error();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid QR code or vehicle not found'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Widget _buildUserLocationMarker() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ).animate(onPlay: (controller) => controller.repeat())
         .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 2.seconds)
         .fadeOut(begin: 0.5),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleMarker(Vehicle vehicle) {
    final isAvailable = vehicle.isAvailable;
    final isBike = vehicle.isBike;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isAvailable ? AppColors.primary : Colors.grey,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isBike ? Icons.pedal_bike : Icons.electric_scooter,
                color: Colors.white,
                size: 18,
              ),
              if (isAvailable)
                Text(
                  '${vehicle.batteryLevel}%',
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
        // Pin indicator
        Container(
          margin: const EdgeInsets.only(top: 2),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: isAvailable ? AppColors.primary : Colors.grey,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        ),
      ],
    ).animate()
     .scale(duration: 400.ms, curve: Curves.elasticOut)
     .fadeIn();
  }

  void _showVehicleDetails(Vehicle vehicle) {
    PremiumBottomSheet.show(
      context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusLg),
                ),
                child: Icon(
                  vehicle.isBike ? Icons.pedal_bike : Icons.electric_scooter,
                  color: AppColors.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicle.vehicleNumber,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      vehicle.vehicleType,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextSecondary
                            : AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: vehicle.isAvailable
                      ? AppColors.success.withOpacity(0.1)
                      : AppColors.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                ),
                child: Text(
                  vehicle.status,
                  style: TextStyle(
                    color: vehicle.isAvailable ? AppColors.success : AppColors.error,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  Icons.battery_charging_full,
                  'map.battery'.tr(),
                  '${vehicle.batteryLevel}%',
                  _getBatteryColor(vehicle.batteryLevel),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildInfoCard(
                  Icons.qr_code,
                  'map.code'.tr(),
                  vehicle.qrCode.length > 8
                      ? '${vehicle.qrCode.substring(0, 8)}...'
                      : vehicle.qrCode,
                  null,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          if (vehicle.isAvailable)
            PrimaryButton(
              text: 'map.reserve'.tr(),
              onPressed: () {
                Haptics.success();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('map.reserved_msg'.tr(args: [vehicle.vehicleNumber])),
                    backgroundColor: AppColors.success,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),

          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value, Color? valueColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showVehicleTypes(BuildContext context) {
    PremiumBottomSheet.show(
      context,
      title: 'map.vehicle_types'.tr(),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildVehicleTypeItem(context, 'map.bikes'.tr(), Icons.pedal_bike, true),
              _buildVehicleTypeItem(context, 'map.scooters'.tr(), Icons.electric_scooter, false),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildVehicleTypeItem(
    BuildContext context,
    String label,
    IconData icon,
    bool isSelected,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => Haptics.selection(),
      child: Column(
        children: [
          AnimatedContainer(
            duration: AppTheme.fastDuration,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withOpacity(0.1)
                  : (isDark ? AppColors.darkSurface : Colors.white),
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.primary
                    : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                width: 2,
              ),
              boxShadow: [
                if (!isSelected)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Icon(
              icon,
              size: 32,
              color: isSelected
                  ? AppColors.primary
                  : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? AppColors.primary
                  : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
