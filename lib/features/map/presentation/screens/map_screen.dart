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
  LatLng _currentLocation = const LatLng(33.5731, -7.5898); // Casablanca default
  bool _isLoadingLocation = true;


  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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
    setState(() {
      _selectedVehicle = vehicle;
    });
    _showVehicleDetails(vehicle);
  }

  @override
  Widget build(BuildContext context) {
    final request = VehicleSearchRequest(
      latitude: _currentLocation.latitude,
      longitude: _currentLocation.longitude,
      radiusInMeters: 5000,
    );
    final vehiclesState = ref.watch(nearbyVehiclesProvider(request));

    return Scaffold(
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
              onPositionChanged: (position, hasGesture) {
                if (hasGesture) {
                  // Optional: Reload vehicles when map moves significantly
                }
              },
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
                      width: 60,
                      height: 60,
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

          // Top Buttons
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildMapButton(
                      icon: Icons.menu,
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                    _buildMapButton(
                      icon: Icons.tune,
                      onPressed: () => _showVehicleTypes(context),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // My Location Button
          Positioned(
            bottom: 100,
            right: AppSpacing.md,
            child: _buildMapButton(
              icon: Icons.my_location,
              onPressed: _centerOnUserLocation,
            ),
          ),

          // Scan Button
          Positioned(
            bottom: AppSpacing.lg,
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            child: PrimaryButton(
              text: 'map.scan_to_ride'.tr(),
              icon: Icons.qr_code_scanner,
              onPressed: () async {
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
                      // For now, constructing temporary one to fix type error
                      final vehicle = Vehicle(
                        id: scanResponse.vehicleId,
                        vehicleNumber: scanResponse.vehicleNumber,
                        vehicleType: scanResponse.vehicleType,
                        status: scanResponse.status,
                        batteryLevel: scanResponse.batteryLevel,
                        location: const LocationData(latitude: 0, longitude: 0), // Unknown
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
              },
            ).animate()
             .fadeIn(delay: 500.ms)
             .slideY(begin: 1, end: 0, curve: Curves.easeOutBack),
          ),

          // Loading Indicator
          if (_isLoadingLocation || vehiclesState.isLoading)
            Positioned(
              top: 120,
              left: AppSpacing.lg,
              right: AppSpacing.lg,
              child: Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: Colors.white,
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
            ),
        ],
      ),
    );
  }

  Widget _buildMapButton({required IconData icon, required VoidCallback onPressed}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
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
          onTap: () {
            Haptics.light();
            onPressed();
          },
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ),
        ),
      ),
    ).animate().scale(duration: 300.ms, curve: Curves.easeOutBack);
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
          width: 44,
          height: 44,
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
          child: Icon(
            isBike ? Icons.pedal_bike : Icons.electric_scooter,
            color: Colors.white,
            size: 20,
          ),
        ),
        if (isAvailable)
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Text(
              '${vehicle.batteryLevel}%',
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: -0.5),
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
                        color: AppColors.textSecondary,
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
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildInfoCard(
                  Icons.qr_code,
                  'map.code'.tr(),
                  vehicle.qrCode,
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

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.textSecondary),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium,
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
    return GestureDetector(
      onTap: () => Haptics.selection(),
      child: Column(
        children: [
          AnimatedContainer(
            duration: AppTheme.fastDuration,
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.border,
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
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
