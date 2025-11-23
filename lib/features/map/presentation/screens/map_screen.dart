import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/models/vehicle.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/haptics.dart';
import '../../../../core/widgets/bottom_sheets/premium_bottom_sheet.dart';
import '../../../../core/widgets/buttons/primary_button.dart';
import '../../../../core/widgets/loading/skeleton_loader.dart';
import 'qr_scanner_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  final MapController _mapController = MapController();
  LatLng _currentLocation = const LatLng(33.5731, -7.5898); // Casablanca default
  bool _isLoadingLocation = true;
  List<Vehicle> _mockVehicles = [];
  Vehicle? _selectedVehicle;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadMockVehicles();
  }

  void _loadMockVehicles() {
    // Mock vehicles around Casablanca
    _mockVehicles = [
      Vehicle(
        id: '1',
        vehicleNumber: 'BIKE001',
        vehicleType: 'Bike',
        status: 'Available',
        batteryLevel: 85,
        location: const LocationData(latitude: 33.5731, longitude: -7.5898),
        qrCode: 'QR001',
      ),
      Vehicle(
        id: '2',
        vehicleNumber: 'SCOOTER001',
        vehicleType: 'Scooter',
        status: 'Available',
        batteryLevel: 92,
        location: const LocationData(latitude: 33.5741, longitude: -7.5908),
        qrCode: 'QR002',
      ),
      Vehicle(
        id: '3',
        vehicleNumber: 'BIKE002',
        vehicleType: 'Bike',
        status: 'Available',
        batteryLevel: 65,
        location: const LocationData(latitude: 33.5721, longitude: -7.5888),
        qrCode: 'QR003',
      ),
      Vehicle(
        id: '4',
        vehicleNumber: 'SCOOTER002',
        vehicleType: 'Scooter',
        status: 'InUse',
        batteryLevel: 45,
        location: const LocationData(latitude: 33.5751, longitude: -7.5918),
        qrCode: 'QR004',
      ),
      Vehicle(
        id: '5',
        vehicleNumber: 'BIKE003',
        vehicleType: 'Bike',
        status: 'Available',
        batteryLevel: 78,
        location: const LocationData(latitude: 33.5711, longitude: -7.5878),
        qrCode: 'QR005',
      ),
    ];
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
        desiredAccuracy: LocationAccuracy.high,
      );

      if (!mounted) return;

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoadingLocation = false;
      });

      _mapController.move(_currentLocation, 15.0);
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoadingLocation = false);
    }
  }

  void _centerOnUserLocation() {
    Haptics.selection();
    _mapController.move(_currentLocation, 15.0);
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
            ),
            children: [
              // Map Tiles
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.ecoride',
                maxZoom: 19,
              ),
              
              // Vehicle Markers
              MarkerLayer(
                markers: _mockVehicles.map((vehicle) {
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
              text: 'Scan to Ride',
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
                  Haptics.success();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Scanned: $result'),
                      backgroundColor: AppColors.success,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ).animate()
             .fadeIn(delay: 500.ms)
             .slideY(begin: 1, end: 0, curve: Curves.easeOutBack),
          ),

          // Loading Indicator
          if (_isLoadingLocation)
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
                      'Getting your location...',
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
         .scale(begin: 0.8, end: 1.2, duration: 2.seconds)
         .fadeOut(begin: 0.5, end: 0),
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
                  'Battery',
                  '${vehicle.batteryLevel}%',
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildInfoCard(
                  Icons.qr_code,
                  'Code',
                  vehicle.qrCode,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.xl),

          if (vehicle.isAvailable)
            PrimaryButton(
              text: 'Reserve Vehicle',
              onPressed: () {
                Haptics.success();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Reserved ${vehicle.vehicleNumber}!'),
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
      title: 'Vehicle Types',
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildVehicleTypeItem(context, 'Bikes', Icons.pedal_bike, true),
              _buildVehicleTypeItem(context, 'Scooters', Icons.electric_scooter, false),
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
