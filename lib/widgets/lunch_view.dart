import 'package:flutter/material.dart';
import 'package:mest/services/food.service.dart';
import 'package:mest/widgets/foodCard.dart';

class LunchView extends StatelessWidget {
  const LunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FoodCard(foods: allLunch())
    );
  }
}
