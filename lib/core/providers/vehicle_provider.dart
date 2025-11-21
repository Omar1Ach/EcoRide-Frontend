import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/vehicle.dart';
import '../models/api_response.dart';
import 'service_providers.dart';

// Nearby Vehicles Provider
final nearbyVehiclesProvider = StateNotifierProvider.family<
    NearbyVehiclesNotifier,
    AsyncValue<List<Vehicle>>,
    VehicleSearchRequest>(
  (ref, request) => NearbyVehiclesNotifier(ref, request),
);

class NearbyVehiclesNotifier
    extends StateNotifier<AsyncValue<List<Vehicle>>> {
  final Ref ref;
  final VehicleSearchRequest searchRequest;

  NearbyVehiclesNotifier(this.ref, this.searchRequest)
      : super(const AsyncValue.loading()) {
    _loadVehicles();
  }

  Future<void> _loadVehicles() async {
    state = const AsyncValue.loading();

    final vehicleService = ref.read(vehicleServiceProvider);
    final response = await vehicleService.searchVehicles(searchRequest);

    if (response is Success<List<Vehicle>>) {
      state = AsyncValue.data(response.data);
    } else if (response is Error<List<Vehicle>>) {
      state = AsyncValue.error(response.message, StackTrace.current);
    }
  }

  Future<void> refresh() => _loadVehicles();
}

// Vehicle Details Provider
final vehicleDetailsProvider =
    FutureProvider.family<Vehicle, String>((ref, vehicleId) async {
  final vehicleService = ref.read(vehicleServiceProvider);
  final response = await vehicleService.getVehicleDetails(vehicleId);

  if (response is Success<Vehicle>) {
    return response.data;
  } else if (response is Error<Vehicle>) {
    throw Exception(response.message);
  }

  throw Exception('Failed to load vehicle details');
});

// QR Scanner Provider
final qrScannerProvider =
    StateNotifierProvider<QrScannerNotifier, AsyncValue<ScanQrResponse?>>(
  (ref) => QrScannerNotifier(ref),
);

class QrScannerNotifier extends StateNotifier<AsyncValue<ScanQrResponse?>> {
  final Ref ref;

  QrScannerNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<bool> scanQrCode(String qrCode) async {
    state = const AsyncValue.loading();

    final vehicleService = ref.read(vehicleServiceProvider);
    final request = ScanQrRequest(qrCode: qrCode);
    final response = await vehicleService.scanQrCode(request);

    if (response is Success<ScanQrResponse>) {
      state = AsyncValue.data(response.data);
      return true;
    } else if (response is Error<ScanQrResponse>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}
