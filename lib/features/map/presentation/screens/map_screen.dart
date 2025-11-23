import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/models/vehicle.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
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

      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoadingLocation = false;
      });

      _mapController.move(_currentLocation, 15.0);
    } catch (e) {
      setState(() => _isLoadingLocation = false);
    }
  }

  void _centerOnUserLocation() {
    _mapController.move(_currentLocation, 15.0);
  }

  void _onVehicleMarkerTap(Vehicle vehicle) {
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
                    width: 50,
                    height: 50,
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

  Widget _buildVehicleMarker(Vehicle vehicle) {
    final isAvailable = vehicle.isAvailable;
    final isBike = vehicle.isBike;
    
    return Container(
      decoration: BoxDecoration(
        color: isAvailable ? AppColors.primary : Colors.grey,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              isBike ? Icons.pedal_bike : Icons.electric_scooter,
              color: Colors.white,
              size: 24,
            ),
          ),
          // Battery indicator
          Positioned(
            top: 2,
            right: 2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                '${vehicle.batteryLevel}%',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showVehicleDetails(Vehicle vehicle) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      vehicle.isBike ? Icons.pedal_bike : Icons.electric_scooter,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.vehicleNumber,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          vehicle.vehicleType,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildInfoRow(Icons.battery_charging_full, 'Battery', '${vehicle.batteryLevel}%'),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.info_outline, 'Status', vehicle.status),
            const SizedBox(height: 12),
            _buildInfoRow(Icons.qr_code, 'QR Code', vehicle.qrCode),
            const SizedBox(height: 24),
            if (vehicle.isAvailable)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reserved ${vehicle.vehicleNumber}!'),
                        backgroundColor: AppColors.success,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Reserve',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
                const SizedBox(width: 40),
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
                _buildVehicleTypeItem(context, 'Bikes', Icons.pedal_bike, true),
                _buildVehicleTypeItem(context, 'Scooters', Icons.electric_scooter, false),
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
