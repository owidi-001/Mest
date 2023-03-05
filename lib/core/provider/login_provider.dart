// Drawer
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginProvider, bool>((ref) {
  return LoginProvider();
});

class LoginProvider extends StateNotifier<bool> {
  LoginProvider() : super(false);

  // Logs in and out
  void toggle() {
    if (kDebugMode) {
      print("Togling :$state");
    }
    state = !state;
    if (kDebugMode) {
      print("Toggled :$state");
    }
  }
}
