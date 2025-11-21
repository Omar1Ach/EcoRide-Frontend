class Validators {
  Validators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final cleanedValue = value.replaceAll(RegExp(r'[^\d+]'), '');

    if (!cleanedValue.startsWith('+212')) {
      return 'Phone number must start with +212';
    }

    if (cleanedValue.length != 13) {
      return 'Please enter a valid Moroccan phone number';
    }

    return null;
  }

  static String? fullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }

    if (value.length < 3) {
      return 'Full name must be at least 3 characters';
    }

    if (!value.contains(' ')) {
      return 'Please enter your full name';
    }

    return null;
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return 'OTP is required';
    }

    if (value.length != 6) {
      return 'OTP must be 6 digits';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(value)) {
      return 'OTP must contain only numbers';
    }

    return null;
  }

  static String? amount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }

    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Please enter a valid amount';
    }

    if (amount < 10) {
      return 'Minimum amount is 10 MAD';
    }

    if (amount > 1000) {
      return 'Maximum amount is 1000 MAD';
    }

    return null;
  }

  static String? required(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? minLength(String? value, int minLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    return null;
  }

  static String? maxLength(String? value, int maxLength, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }

    return null;
  }
}
