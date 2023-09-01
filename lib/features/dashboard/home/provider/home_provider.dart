// Selected menu
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCategoryProvider =
    StateNotifierProvider<HomeCategoryProvider, int>((ref) {
  return HomeCategoryProvider();
});

class HomeCategoryProvider extends StateNotifier<int> {
  HomeCategoryProvider() : super(0);

  void setCategory(int value) {
    state = value;
  }
}
