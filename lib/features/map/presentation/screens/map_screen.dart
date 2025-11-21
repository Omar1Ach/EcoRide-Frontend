import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EcoRide'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              // TODO: Implement QR scanner
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Map Placeholder
          Container(
            color: AppColors.surfaceVariant,
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 64,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Map View',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Google Maps will be integrated here',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search Bar
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.textSecondary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'Search for vehicles nearby...',
                          border: InputBorder.none,
                        ),
                        onTap: () {
                          // TODO: Implement search
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune),
                      onPressed: () {
                        // TODO: Implement filters
                      },
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
              mini: true,
              onPressed: () {
                // TODO: Center map on user location
              },
              child: const Icon(Icons.my_location),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showVehiclesList(context);
        },
        icon: const Icon(Icons.electric_bike),
        label: const Text('Find Vehicles'),
      ),
    );
  }

  void _showVehiclesList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nearby Vehicles',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '${AppConstants.defaultSearchRadius.toInt()}m',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 5,
                  itemBuilder: (context, index) => ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.electric_bike,
                        color: AppColors.primary,
                      ),
                    ),
                    title: Text('Electric Bike #${index + 1}'),
                    subtitle: Text('${(index + 1) * 50}m away • ${80 - (index * 10)}% battery'),
                    trailing: const Text(
                      '5.00 MAD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    onTap: () {
                      // TODO: Show vehicle details
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
