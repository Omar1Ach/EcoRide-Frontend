import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Haptics {
  Haptics._();

  static Future<void> light() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.light);
    }
  }

  static Future<void> medium() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.medium);
    }
  }

  static Future<void> heavy() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.heavy);
    }
  }

  static Future<void> success() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
  }

  static Future<void> error() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  static Future<void> selection() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.selection);
    }
  }
}
