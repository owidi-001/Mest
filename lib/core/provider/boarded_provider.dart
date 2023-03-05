import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/core/prefs/app_prefs.dart';

final boardedProvider = Provider<bool>((ref) {
  // Check if boarded
  var isBoarded = false;

  AppPreferences().boarded().then((value) {
    isBoarded = value;
  });

  return isBoarded;
});
