import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/reservation.dart';
import '../models/api_response.dart';
import 'service_providers.dart';

// Active Reservation Provider
final activeReservationProvider = StateNotifierProvider<
    ActiveReservationNotifier,
    AsyncValue<CreateReservationResponse?>>(
  (ref) => ActiveReservationNotifier(ref),
);

class ActiveReservationNotifier
    extends StateNotifier<AsyncValue<CreateReservationResponse?>> {
  final Ref ref;

  ActiveReservationNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<bool> createReservation(String vehicleId) async {
    state = const AsyncValue.loading();

    final reservationService = ref.read(reservationServiceProvider);
    final request = CreateReservationRequest(vehicleId: vehicleId);
    final response = await reservationService.createReservation(request);

    if (response is Success<CreateReservationResponse>) {
      state = AsyncValue.data(response.data);
      return true;
    } else if (response is Error<CreateReservationResponse>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  Future<bool> cancelReservation(String reservationId) async {
    state = const AsyncValue.loading();

    final reservationService = ref.read(reservationServiceProvider);
    final response = await reservationService.cancelReservation(reservationId);

    if (response is Success<bool>) {
      state = const AsyncValue.data(null);
      return true;
    } else if (response is Error<bool>) {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }

    return false;
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

// Reservation Details Provider
final reservationDetailsProvider =
    FutureProvider.family<Reservation, String>((ref, reservationId) async {
  final reservationService = ref.read(reservationServiceProvider);
  final response = await reservationService.getReservation(reservationId);

  if (response is Success<Reservation>) {
    return response.data;
  } else if (response is Error<Reservation>) {
    throw Exception(response.message);
  }

  throw Exception('Failed to load reservation details');
});
