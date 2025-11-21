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
      final userId = await _storage.read(key: ApiConstants.userIdKey);

      if (token != null && userId != null) {
        // Fetch user profile
        final userService = ref.read(userServiceProvider);
        final response = await userService.getProfile(userId);

        if (response is Success<User>) {
          state = state.copyWith(
            isAuthenticated: true,
            isLoading: false,
            user: response.data,
          );
          ref.read(currentUserProvider.notifier).state = response.data;
        } else {
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

  Future<String?> register(RegisterRequest request) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    final authService = ref.read(authServiceProvider);
    final response = await authService.register(request);

    if (response is Success<AuthResponse>) {
      state = state.copyWith(isLoading: false);
      return response.data.userId;
    } else if (response is Error<AuthResponse>) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: response.message,
      );
      return null;
    }

    return null;
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
      // Fetch user profile
      final userService = ref.read(userServiceProvider);
      final userResponse = await userService.getProfile(response.data.userId);

      if (userResponse is Success<User>) {
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          user: userResponse.data,
        );
        ref.read(currentUserProvider.notifier).state = userResponse.data;
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
