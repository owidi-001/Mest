import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Selected menu
final dashBoardNotifierProvider =
    StateNotifierProvider<DashBoardProvider, int>((ref) {
  return DashBoardProvider();
});

class DashBoardProvider extends StateNotifier<int> {
  DashBoardProvider() : super(0);

  void setPosition(int value) {
    state = value;
  }
}

// Drawer
final drawerNotifierProvider =
    StateNotifierProvider<DrawerProvider, bool>((ref) {
  return DrawerProvider();
});

class DrawerProvider extends StateNotifier<bool> {
  DrawerProvider() : super(false);

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

// Search
final searchNotifierProvider =
    StateNotifierProvider<SearchProvider, bool>((ref) {
  return SearchProvider();
});

class SearchProvider extends StateNotifier<bool> {
  SearchProvider() : super(false);

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
