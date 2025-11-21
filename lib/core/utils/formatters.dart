import 'package:intl/intl.dart';

class Formatters {
  Formatters._();

  static String currency(double amount) {
    return '${amount.toStringAsFixed(2)} MAD';
  }

  static String distance(double meters) {
    if (meters < 1000) {
      return '${meters.toStringAsFixed(0)} m';
    } else {
      return '${(meters / 1000).toStringAsFixed(2)} km';
    }
  }

  static String duration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    } else {
      final hours = minutes ~/ 60;
      final mins = minutes % 60;
      return '$hours h $mins min';
    }
  }

  static String dateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
  }

  static String date(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static String time(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  static String batteryLevel(int level) {
    return '$level%';
  }

  static String phone(String phoneNumber) {
    if (phoneNumber.startsWith('+212')) {
      final number = phoneNumber.substring(4);
      if (number.length == 9) {
        return '+212 ${number.substring(0, 3)} ${number.substring(3, 5)} ${number.substring(5, 7)} ${number.substring(7)}';
      }
    }
    return phoneNumber;
  }

  static String vehicleType(String type) {
    switch (type.toLowerCase()) {
      case 'electric_bike':
        return 'Electric Bike';
      case 'electric_scooter':
        return 'Electric Scooter';
      case 'bike':
        return 'Bike';
      case 'scooter':
        return 'Scooter';
      default:
        return type;
    }
  }

  static String vehicleStatus(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return 'Available';
      case 'reserved':
        return 'Reserved';
      case 'inuse':
        return 'In Use';
      case 'maintenance':
        return 'Maintenance';
      default:
        return status;
    }
  }

  static String transactionType(String type) {
    switch (type.toLowerCase()) {
      case 'topup':
        return 'Top-up';
      case 'trip':
        return 'Trip Payment';
      case 'refund':
        return 'Refund';
      default:
        return type;
    }
  }
}
