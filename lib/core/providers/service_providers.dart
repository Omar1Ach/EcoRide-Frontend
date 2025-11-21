import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';
import '../services/auth_service.dart';
import '../services/vehicle_service.dart';
import '../services/reservation_service.dart';
import '../services/trip_service.dart';
import '../services/wallet_service.dart';
import '../services/user_service.dart';

// Dio Client Provider
final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});

// Auth Service Provider
final authServiceProvider = Provider<AuthService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return AuthService(dioClient);
});

// Vehicle Service Provider
final vehicleServiceProvider = Provider<VehicleService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return VehicleService(dioClient);
});

// Reservation Service Provider
final reservationServiceProvider = Provider<ReservationService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return ReservationService(dioClient);
});

// Trip Service Provider
final tripServiceProvider = Provider<TripService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return TripService(dioClient);
});

// Wallet Service Provider
final walletServiceProvider = Provider<WalletService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return WalletService(dioClient);
});

// User Service Provider
final userServiceProvider = Provider<UserService>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return UserService(dioClient);
});
