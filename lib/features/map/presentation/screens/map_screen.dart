import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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
      // Check permissions
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

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoadingLocation = false;
      });

      // Animate to current location
      _mapController.move(_currentLocation, 15.0);
    } catch (e) {
      setState(() => _isLoadingLocation = false);
    }
  }

  void _centerOnUserLocation() {
    _mapController.move(_currentLocation, 15.0);
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
              
              // User Location Marker
              if (!_isLoadingLocation)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentLocation,
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
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
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // User Profile / Drawer Button
                    FloatingActionButton.small(
                      heroTag: 'drawer_btn',
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textPrimary,
                      elevation: 4,
                      child: const Icon(Icons.person_outline),
                    ),

                    // Filter Button
                    FloatingActionButton.small(
                      heroTag: 'filter_btn',
                      onPressed: () {
                        _showVehicleTypes(context);
                      },
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.textPrimary,
                      elevation: 4,
                      child: const Icon(Icons.tune),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // My Location Button
          Positioned(
            bottom: 100,
            right: 16,
            child: FloatingActionButton(
              heroTag: 'location_btn',
              mini: true,
              onPressed: _centerOnUserLocation,
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primary,
              child: const Icon(Icons.my_location),
            ),
          ),

          // Scan Button
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement QR scanner
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('QR Scanner coming soon!'),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.qr_code_scanner),
                  SizedBox(width: 8),
                  Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Loading Indicator
          if (_isLoadingLocation)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Getting your location...'),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showVehicleTypes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40), // Spacer for centering
                Text(
                  'Vehicle types',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildVehicleTypeItem(
                  context,
                  'Bikes',
                  Icons.pedal_bike,
                  true,
                ),
                _buildVehicleTypeItem(
                  context,
                  'Scooters',
                  Icons.electric_scooter,
                  false,
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleTypeItem(
    BuildContext context,
    String label,
    IconData icon,
    bool isSelected,
  ) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: isSelected
                ? Border.all(color: AppColors.primary, width: 2)
                : null,
          ),
          child: Icon(
            icon,
            size: 40,
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
        ),
      ],
    );
  }
}
