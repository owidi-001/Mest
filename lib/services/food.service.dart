import 'dart:math';

import 'package:mest/models/food.model.dart';
import 'package:mest/utils/constants.dart';

List<Food> breakfast = [
  Food(name: "Ginger", image: "${baseUrl}ginger.png"),
  Food(name: "Lamb Meat", image: "${baseUrl}lamb_meat.png"),
  Food(name: "Pepper", image: "${baseUrl}pepper_red.png"),
  Food(name: "Carrots", image: "${baseUrl}carrots.png"),
];

List<Food> allBreakFast() {
  return breakfast;
}

List<Food> lunch = [
  Food(name: "Ginger", image: "${baseUrl}ginger.png"),
  Food(name: "Lamb Meat", image: "${baseUrl}lamb_meat.png"),
  Food(name: "Pepper", image: "${baseUrl}pepper_red.png"),
  Food(name: "Carrots", image: "${baseUrl}carrots.png"),
];

List<Food> allLunch() {
  return lunch;
}

List<Food> supper = [
  Food(name: "Ginger", image: "${baseUrl}ginger.png"),
  Food(name: "Lamb Meat", image: "${baseUrl}lamb_meat.png"),
  Food(name: "Pepper", image: "${baseUrl}pepper_red.png"),
  Food(name: "Carrots", image: "${baseUrl}carrots.png"),
];

List<Food> allSupper() {
  return supper;
}

List<Food> snack = [
  Food(name: "Ginger", image: "${baseUrl}ginger.png"),
  Food(name: "Lamb Meat", image: "${baseUrl}lamb_meat.png"),
  Food(name: "Pepper", image: "${baseUrl}pepper_red.png"),
  Food(name: "Carrots", image: "${baseUrl}carrots.png"),
];

List<Food> allSnack() {
  return snack;
}

Food randomFood(List<Food> foods) {
  return foods[Random().nextInt(foods.length)];
}
