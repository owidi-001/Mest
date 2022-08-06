import 'package:flutter/material.dart';
import 'package:mest/models/food.model.dart';
import 'package:mest/theme/theme.dart';

class FoodCardWidgetHorizontal extends StatelessWidget {
  final Food food;
  final VoidCallback onTapCallback;
  const FoodCardWidgetHorizontal(
      {Key? key, required this.food, required this.onTapCallback})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTapCallback(),
      child: Card(
          color: AppTheme.lightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    food.image,
                    width: 120,
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    food.name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkColor),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
