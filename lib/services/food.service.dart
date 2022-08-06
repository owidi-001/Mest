import 'dart:math';

import 'package:mest/models/food.model.dart';
import 'package:mest/utils/constants.dart';

FoodCategory category1 = FoodCategory(name: "Breakfast");
FoodCategory category2 = FoodCategory(name: "Lunch");
FoodCategory category3 = FoodCategory(name: "Supper");
FoodCategory category4 = FoodCategory(name: "Snack");

List<Food> foods = [
  Food(
      name: "Ginger",
      image: "${baseUrl}ginger.png",
      description: "Food description",
      category: category1),
  Food(
      name: "Lamb Meat",
      image: "${baseUrl}lamb_meat.png",
      description: "Food description",
      category: category1),
  Food(
      name: "Pepper",
      image: "${baseUrl}pepper_red.png",
      description: "Food description",
      category: category1),
  Food(
      name: "Carrots",
      image: "${baseUrl}carrots.png",
      description: "Food description",
      category: category1),
];

List<Food> allBreakFast() {
  List<Food> foodFiltered = [];
  for (var food in foods) {
    if (food.category.name.toUpperCase() == "BREAKFAST") {
      foodFiltered.add(food);
    }
  }
  return foodFiltered;
}

List<Food> allLunch() {
  List<Food> foodFiltered = [];
  for (var food in foods) {
    if (food.category.name.toUpperCase() == "LUNCH") {
      foodFiltered.add(food);
    }
  }
  return foodFiltered;
}

List<Food> allSupper() {
  List<Food> foodFiltered = [];
  for (var food in foods) {
    if (food.category.name.toUpperCase() == "SUPPER") {
      foodFiltered.add(food);
    }
  }
  return foodFiltered;
}

List<Food> allSnack() {
  List<Food> foodFiltered = [];
  for (var food in foods) {
    if (food.category.name.toUpperCase() == "SNACKS") {
      foodFiltered.add(food);
    }
  }
  return foodFiltered;
}

List<Food> allFoods() {
  return foods;
}

Food randomFood(List<Food> foods) {
  return foods[Random().nextInt(foods.length)];
}
