import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/utils/utils.dart';

final foodProvider = StateNotifierProvider((ref) {
  return FoodProvider();
});

class FoodProvider extends StateNotifier<List<Food>> {
  List<Food> _foods = [];
  // getter
  List<Food> get foods => _foods;

  LoadStatus _status = LoadStatus.unknown;
  // getter
  LoadStatus get status => _status;

  int totalEats = 0;

  // constructor
  FoodProvider() : super(<Food>[]) {
    init();
  }

  void init() {
    _status = LoadStatus.loading;

    // Call service to get food from database
    var response = FoodService.getAllMenu().then(
        (value) => {
              if (value.isNotEmpty)
                {
                  _foods = value.map((e) => Food.fromMap(e)).toList(),
                  _status = LoadStatus.success,
                  // Get total eats
                  foods.map((e) => {totalEats += e.eats})
                }
            }, onError: (e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }

  void refresh() {
    init();
  }
}
