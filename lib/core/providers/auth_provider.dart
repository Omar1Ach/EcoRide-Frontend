import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';
import '../models/api_response.dart';
import '../constants/api_constants.dart';
import 'service_providers.dart';

// Current User State
final currentUserProvider = StateProvider<User?>((ref) => null);

// Auth State Provider
final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(ref),
);

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    this.errorMessage,
    this.user,
  });

  factory AuthState.initial() => AuthState(
        isAuthenticated: false,
        isLoading: false,
      );

  AuthState copyWith({
    bool? isAuthenticated,
    bool? isLoading,
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }
}

class AuthStateNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  AuthStateNotifier(this.ref) : super(AuthState.initial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    state = state.copyWith(isLoading: true);

    try {
      final token = await _storage.read(key: ApiConstants.accessTokenKey);
      final userJson = await _storage.read(key: ApiConstants.userCacheKey);

      if (token != null && userJson != null) {
        try {
          final user = User.fromJson(jsonDecode(userJson));
          state = state.copyWith(
            isAuthenticated: true,
            isLoading: false,
            user: user,
          );
          ref.read(currentUserProvider.notifier).state = user;
        } catch (e) {
          // Failed to parse cached user
          state = state.copyWith(isAuthenticated: false, isLoading: false);
        }
      } else {
        state = state.copyWith(isAuthenticated: false, isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
        isAuthenticated: false,
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  // Public method for checking auth status
  Future<bool> checkAuthStatus() async {
    await _checkAuthStatus();
    return state.isAuthenticated;
  }

  Future<bool> register(RegisterRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final authService = ref.read(authServiceProvider);
    final response = await authService.register(request);

    if (response is Success<void>) {
      state = state.copyWith(isLoading: false);
      return true;
    } else if (response is Error<void>) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: response.message,
      );
      return false;
    }

    return false;
  }

  Future<bool> verifyOtp(VerifyOtpRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final authService = ref.read(authServiceProvider);
    final response = await authService.verifyOtp(request);

    if (response is Success<bool>) {
      state = state.copyWith(isLoading: false, isAuthenticated: true);
      return true;
    } else if (response is Error<bool>) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: response.message,
      );
      return false;
    }

    return false;
  }

  Future<bool> login(LoginRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final authService = ref.read(authServiceProvider);
    final response = await authService.login(request);

    if (response is Success<AuthResponse>) {
      final authResponse = response.data;
      
      // If user object is returned, cache it
      if (authResponse.user != null) {
        await _storage.write(
          key: ApiConstants.userCacheKey,
          value: jsonEncode(authResponse.user!.toJson()),
        );

        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          user: authResponse.user,
        );
        ref.read(currentUserProvider.notifier).state = authResponse.user;
        return true;
      } else {
        // Fallback if user is not in response (should not happen based on requirements)
        // We might need to fetch it, but endpoint is missing.
        // For now, assume login succeeds but user data might be incomplete.
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
        );
        return true;
      }
    } else if (response is Error<AuthResponse>) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: response.message,
      );
    }

    return false;
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    final authService = ref.read(authServiceProvider);
    await authService.logout();

    state = AuthState.initial();
    ref.read(currentUserProvider.notifier).state = null;
  }
}
