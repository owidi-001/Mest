import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/services/food.service.dart';

final foodProvider = ChangeNotifierProvider((ref) {
  return FoodProvider();
});

class FoodProvider extends ChangeNotifier {
  // List of foods
  List<Food> _foods = [];
  // State
  Status _status = Status.initial;
  // total eats
  int totalEats = 0;

  // getters
  List<Food> get items => _foods;
  Status get status => _status;

  // setters
  set itemsSet(List<Food> foods) => _foods = foods;
  set statusSet(Status status) => _status = status;

  // Constructor
  static FoodProvider instance = FoodProvider();

  // Fetch
  void fetch() async {
    var response = FoodService.getAllMenu();
    response.then((value) {
      try {
        _foods = value.map((e) => Food.fromMap(e)).toList();
        notifyListeners();
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }, onError: (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  // Create
  Future<bool> create(String? image, String? name, String? description) async {
    var response = FoodService.createItem(image, name, description);
    response.then((value) {
      return true;
    }, onError: (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return false;
    });
    return false;
  }

  // Update
  Future<bool> update(int id, String? name, String? description) async {
    var response = FoodService.updateItem(id, name, description);

    response.then((value) {
      refresh();
      return true;
    }, onError: (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return false;
    });
    return false;
  }

  // Delete
  Future<bool> delete(int id) async {
    var response = FoodService.deleteItem(id);
    response.then((value) {
      refresh();
      return true;
    }, onError: (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return false;
    });
    return false;
  }

  // Calculate eats
  void calculateEats() {
    int total = 0;
    items.map((e) => total += e.eats);
    totalEats = total;
    notifyListeners();
  }

  void refresh() {
    fetch();
  }
}

enum Status { initial, loading, success, failed }
