import 'package:flutter/material.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/widgets/foodCard.dart';

class SupperView extends StatelessWidget {
  const SupperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FoodCard(foods: allSupper(),);
  }
}
