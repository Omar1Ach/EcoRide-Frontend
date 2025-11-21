import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/trip.dart';
import '../models/api_response.dart';
import 'service_providers.dart';
import 'auth_provider.dart';

// Active Trip Provider
final activeTripProvider =
    StateNotifierProvider<ActiveTripNotifier, AsyncValue<Trip?>>(
  (ref) => ActiveTripNotifier(ref),
);

class ActiveTripNotifier extends StateNotifier<AsyncValue<Trip?>> {
  final Ref ref;

  ActiveTripNotifier(this.ref) : super(const AsyncValue.loading()) {
    _loadActiveTrip();
  }

  Future<void> _loadActiveTrip() async {
    final user = ref.read(currentUserProvider);
    if (user == null) {
      state = const AsyncValue.data(null);
      return;
    }

    final tripService = ref.read(tripServiceProvider);
    final response = await tripService.getActiveTrip(user.id);

    if (response is Success<Trip?>) {
      state = AsyncValue.data(response.data);
    } else if (response is Error<Trip?>) {
      state = AsyncValue.error(response.message, StackTrace.current);
    }
  }

  Future<bool> startTrip(String reservationId) async {
    state = const AsyncValue.loading();

    final tripService = ref.read(tripServiceProvider);
    final request = StartTripRequest(reservationId: reservationId);
    final response = await tripService.startTrip(request);

    if (response is Success<StartTripResponse>) {
      await _loadActiveTrip();
      return true;
    } else if (response is Error<StartTripResponse>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  Future<bool> endTrip(String tripId, double latitude, double longitude) async {
    state = const AsyncValue.loading();

    final tripService = ref.read(tripServiceProvider);
    final request = EndTripRequest(
      latitude: latitude,
      longitude: longitude,
    );
    final response = await tripService.endTrip(tripId, request);

    if (response is Success<EndTripResponse>) {
      state = const AsyncValue.data(null);
      return true;
    } else if (response is Error<EndTripResponse>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  Future<void> refresh() => _loadActiveTrip();
}

// Trip History Provider
final tripHistoryProvider =
    FutureProvider.family<List<Trip>, TripHistoryRequest>((ref, request) async {
  final tripService = ref.read(tripServiceProvider);
  final response = await tripService.getTripHistory(request);

  if (response is Success<List<Trip>>) {
    return response.data;
  } else if (response is Error<List<Trip>>) {
    throw Exception(response.message);
  }

  return [];
});

// Trip Details Provider
final tripDetailsProvider =
    FutureProvider.family<Trip, String>((ref, tripId) async {
  final tripService = ref.read(tripServiceProvider);
  final response = await tripService.getTripDetails(tripId);

  if (response is Success<Trip>) {
    return response.data;
  } else if (response is Error<Trip>) {
    throw Exception(response.message);
  }

  throw Exception('Failed to load trip details');
});

// Trip Receipt Provider
final tripReceiptProvider =
    FutureProvider.family<TripReceipt, String>((ref, tripId) async {
  final tripService = ref.read(tripServiceProvider);
  final response = await tripService.getTripReceipt(tripId);

  if (response is Success<TripReceipt>) {
    return response.data;
  } else if (response is Error<TripReceipt>) {
    throw Exception(response.message);
  }

  throw Exception('Failed to load trip receipt');
});
